class Api::V1::TasksController < ApplicationController
  
  def billed
    user = User.find_by(id: params[:user_id])
    render json: tasks(true, user)
  end

  def unbilled
    user = User.find_by(id: params[:user_id])
    render json: tasks(false, user)
  end

  def create

    if params[:clientValue][:value]
      client = Client.find_by(id: params[:clientValue][:value]) 
    else
      client = Task.find_by(id: params[:task_id]).project.client
    end

    if params[:projectValue][:className]
      project = client.projects.create(name: project_name)
    elsif params[:projectValue][:value]
      project = Project.find_by(id: params[:projectValue][:value])
    else
      project = Task.find_by(id: params[:task_id]).project
    end

    if params[:task_id]
      task = Task.find_by(id: params[:task_id])
      task.project = project
    else
      task = project.tasks.new()
    end
      
    if project.bill_rate
      task.bill_rate = project.bill_rate
    else 
      user = User.find_by(id: params[:user_id])
      task.bill_rate = user.bill_rate
    end

    task.date = project_date
    task.assign_attributes(task_description_and_bill_time)
    
    if task.save 
      render json: { id: task, success: 'ok'}
    else
      render json: { message: "error, #{task.errors.full_messages}"}, status: 412
    end

  end

  def destroy
    task = Task.find_by(id: params[:id])

    if task.delete
      render json: { message: "task deleted", success: 'ok'}
    else
      render json: { message: "error, #{task.errors.full_messages}"}, status: 412
    end

  end

  private

  def tasks(billed_status, user)
    Task.newest.map do |task|
      if task.billed == billed_status && task.project.client.user == user
        {
          client: task.project.client.name,
          client_id: task.project.client.id,
          project: task.project.name,
          project_id: task.project.id,
          bill_time: task.bill_time,
          bill_rate: task.bill_rate,
          description: task.description,
          total: task.total,
          billed: task.billed, 
          date: task.date,
          task_id: task.id
        }
      end
    end.select{|t| t != nil}
  end

  def project_name
    params.require(:projectValue).require(:value)
  end

  def task_description_and_bill_time
    params.require(:task).permit(:bill_time, :description)
  end

  def project_date
    params.require(:startDate)
  end
end
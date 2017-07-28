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
    binding.pry
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
    end
  end
end
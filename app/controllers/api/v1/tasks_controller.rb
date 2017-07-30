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
    client = Client.find_by(id: params[:clientValue][:value])

    if params[:projectValue][:className]
      project = client.projects.create(name: project_name)
    else 
      project = Project.find_by(id: params[:projectValue][:value])
    end

    if project.valid?
      task = project.tasks.new(task_description_and_bill_time)
      
      if project.bill_rate
        task.bill_rate = project.bill_rate
      else 
        user = User.find_by(id: params[:user_id])
        task.bill_rate = user.bill_rate
      end

      task.date = project_date
      
      if task.save 
        render json: { id: task, success: 'ok'}
      else
        render json: { message: "error, #{task.errors}"}, status: 412
      end
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
    end
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

# {"clientData"=>[
#   {"value"=>10, "label"=>"Bayer-Lakin"}, {"value"=>13, "label"=>"Gulgowski LLC"}, {"value"=>41, "label"=>"this is a client name"}, {"value"=>42, "label"=>"client name"}, {"value"=>43, "label"=>"client name"}, {"value"=>44, "label"=>"Client Name"}, {"value"=>45, "label"=>"New Clien
# t"}, {"value"=>46, "label"=>"name"}, {"value"=>47, "label"=>"New Name"}, {"value"=>48, "label"=>"test"}, {"value"=>49, "label"=>"test"}, {"value"=>50, "label"=>"New
#  Client"}, {"value"=>51, "label"=>"test"}, {"value"=>52, "label"=>"My New client"}, {"value"=>53, "label"=>"New client"}
# ], 
# "clientArray"=>[], 
# "projectData"=>[{"value"=>3, "label"=>"synthesize B2C solutions"}, {"value"=>6, "label"=>"orchestrate plug-and-play synergies"}, {"value"=>22, "label"=>"e-enable sticky synergies"}, {"va
# lue"=>32, "label"=>"generate vertical paradigms"}, {"value"=>39, "label"=>"strategize virtual infrastructures"}, {"value"=>50, "label"=>"aggregate B2B synergies"},
# {"value"=>60, "label"=>"revolutionize bleeding-edge infomediaries"}, {"value"=>82, "label"=>"hello"}
# ], 

# "clientValue"=>{"value"=>10, "label"=>"Bayer-Lakin"}, 

# "projectValue"=>{"value"=>3, "label"=>"synthesize B2C solutions"}, 
# "projectValue"=>{"value"=>"make new project for bayer lakin", "label"=>"make new project for bayer lakin", "className"=>"Select-create-option-placeholder"}

# "startDate"=>"2017-07-30T16:57:19.950Z", 
# "bill_time"=>"1", 
# "description"=>"", 

# "client_id"=>10, //not necessary

# ""=>"hello", "controller"=>"api/v1/tasks", "action"=>"create", 

# "user_id"=>"1", 

# "task"=>{"bill_time"=>"1", "description"=>"", "date"=>""}} permitted: false>
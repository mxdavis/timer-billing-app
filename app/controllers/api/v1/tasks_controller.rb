class Api::V1::TasksController < ApplicationController
  
  def billed
    render json: tasks(true)
  end

  def unbilled
    render json: tasks(false)
  end

  def create
    binding.pry
  end

  private

  def tasks(billed_status)
    Task.newest.map do |task|
      if task.billed == billed_status
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
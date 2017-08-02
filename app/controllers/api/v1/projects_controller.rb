class Api::V1::ProjectsController < ApplicationController

  def create
    if client = Client.find_by(id: params[:clientId])
      project = client.projects.build(project_params)
      if project.save
        render json: { id: project, success: 'ok'}
      else
        render json: { message: "error, #{project.errors.full_messages}"}, status: 412
      end
    else 
      render json: { message: "no project found for this project"}, status: 412
    end
  end

  private

  def project_params
    params.permit(:name, :bill_rate)
  end
end
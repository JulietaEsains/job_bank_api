class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: [:show, :update, :destroy]

  def index
    @job_applications = Job_application.all
    render status: 200, json: {job_applications: @job_applications}
  end

  def show
    render status: 200, json: {job_application: @job_application}
  end

  def create
    candidate = Candidate.find_by(id: params[:candidate_id])
    @job_application = candidate.job_applications.new(job_application_params)
    if @job_application.save
      render status: 200, json: {job_application: @job_application}
    else
      render status: 400, json: {message: @job_application.errors.details}
    end
  end

  def update
    if @job_application.update(job_application_params)
      render status: 200, json: {job_application: @job_application}
    else
      render status: 400, json: {message: @job_application.errors.details}
    end
  end

  def destroy
    if @job_application.destroy
      render status: 200, json: {message: "Aplicación de trabajo borrada con éxito."}
    else
      render status: 400, json: {message: @job_application.errors.details}
    end
  end

  private 
  def set_job_application
    @job_application = Job_application.find_by(id: params:[:id])
    return if @job_application.present?

    render status: 404, json: {message: "No se encontró la aplicación de trabajo"}
    false
  end
  
  def job_application_params
    params.require(:job_application).permit(:status, :message)
  end
end

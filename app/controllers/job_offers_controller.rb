class JobOffersController < ApplicationController
  before_action :set_job_offer, only: [:show, :update, :destroy]
  before_action :set_company, only: [:create, :update, :destroy]
  before_action :check_token, only: [:create, :update, :destroy]

  def index
    @job_offers = Job_offer.all
    render status: 200, json: {job_offers: @job_offers}
  end

  def show
    render status: 200, json: {job_offer: @job_offer}
  end

  def create
    @job_offer = @company.job_offers.new(job_offer_params)
    if @job_offer.save
      render status: 200, json: {job_offer: @job_offer}
    else
      render status: 400, json: {message: @job_offer.errors.details}
    end
  end

  def update
    if @job_offer.update(job_offer_params)
      render status: 200, json: {job_offer: @job_offer}
    else
      render status: 400, json: {message: @job_offer.errors.details}
    end
  end

  def destroy
    if @job_offer.destroy
      render status: 200, json: {message: "Oferta de trabajo borrada con éxito."}
    else
      render status: 400, json: {message: @job_offer.errors.details}
    end
  end

  def apply
    @job_application = Job_application.find_or_initialize_by(job_offer_id: @job_offer.id, candidate_id: params[:candidate_id])
    if @job_application.persisted?
      render status: 200, json: {job_application: "El candidato ya aplicó al trabajo"}
    elsif @job_application.save
      render status: 200, json: {job_application: @job_application}
    else
      render status: 400, json: {message: @job_application.errors.details}
    end
  end

  private 
  def set_job_offer
    @job_offer = Job_offer.find_by(id: params:[:id])
    return if @job_offer.present?

    render status: 404, json: {message: "No se encontró la oferta de trabajo"}
    false
  end
  
  def job_offer_params
    params.require(:job_offer).permit(:title, :description)
  end

  def set_company
    @company = Company.find_by(id: params:[:company_id]) || @job_offer.company
    return if @company.present?

    render status: 404, json: {message: "No se encontró la compañía"}
    false
  end

  def check_token
    return if request.headers["Authorization"] == "Bearer #{@company.token}"

      render status: 401, json: {message: "No coincide el token de autenticación"}
      false
  end
end

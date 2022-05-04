class JobOffersController < ApplicationController
  before_action :set_job_offer, only: [:show, :update, :destroy]

  def index
    @job_offers = Job_offer.all
    render status: 200, json: {job_offers: @job_offers}
  end

  def show
    render status: 200, json: {job_offer: @job_offer}
  end

  def create
    company = Company.find_by(id: params[:company_id])
    @job_offer = company.job_offers.new(job_offer_params)
    if @job_offer.save
      render status: 200, json: {job_offer: @job_offer}
    else
      render status: 400, json: {message: @job_offer.errors.details}
    end
  end

  def update
    @job_offer = Job_offer.update(job_offer_params)
    if @job_offer.save
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

  private 
  def set_job_offer
    @job_offer = Job_offer.find(params:[:id])
  end
  
  def job_offer_params
    params.require(:job_offer).permit(:title, :description)
  end
end

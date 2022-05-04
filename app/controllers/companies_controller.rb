class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :update, :destroy]

  def index
    @companies = Company.all
    render status: 200, json: {companies: @companies}
  end

  def show
    render status: 200, json: {company: @company}
  end

  def create
    @company = Company.new(company)
    if @company.save
      render status: 200, json: {company: @company}
    else
      render status: 400, json: {message: @company.errors.details}
    end
  end

  def update
    @company = Company.update(company)
    if @company.save
      render status: 200, json: {company: @company}
    else
      render status: 400, json: {message: @company.errors.details}
    end
  end

  def destroy
    if @company.destroy
      render status: 200, json: {message: "Compañía borrada con éxito."}
    else
      render status: 400, json: {message: @company.errors.details}
    end
  end

  private 
  def set_company
    @company = Company.find(params:[:id])
  end
  
  def company_params
    params.require(:company).permit(:name, :description)
  end
end

class CandidatesController < ApplicationController
  before_action :set_candidate, only: [:show, :update, :destroy]
  before_action :check_token, only: [:update, :destroy]

  def index
    @candidates = Candidate.all
    render status: 200, json: {candidates: @candidates}
  end

  def show
    render status: 200, json: {candidate: @candidate}
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      render status: 200, json: {candidate: @candidate}
    else
      render status: 400, json: {message: @candidate.errors.details}
    end
  end

  def update
    if @candidate.update(candidate_params)
      render status: 200, json: {candidate: @candidate}
    else
      render status: 400, json: {message: @candidate.errors.details}
    end
  end

  def destroy
    if @candidate.destroy
      render status: 200, json: {message: "Candidato borrado con éxito."}
    else
      render status: 400, json: {message: @candidate.errors.details}
    end
  end

  private 
  def set_candidate
    @candidate = Candidate.find_by(id: params:[:id])
    return if @candidate.present?

    render status: 404, json: {message: "No se encontró el candidato"}
    false
  end
  
  def candidate_params
    params.require(:candidate).permit(:name, :lastName, :age)
  end

  def check_token
    return if request.headers["Authorization"] == "Bearer #{@candidate.token}"

      render status: 401, json: {message: "No coincide el token de autenticación"}
      false
  end
end

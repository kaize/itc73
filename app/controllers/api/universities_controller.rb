class Api::UniversitiesController < Api::ApplicationController
  respond_to :json
  def index
    @universities = User.universities_by_term params[:term]
    respond_with(@universities)
  end
end


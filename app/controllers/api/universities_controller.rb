class Api::UniversitiesController < Api::ApplicationController
  def index
    users = User.like_by_university params[:term]
    @universities = users.map(&:university).uniq
    respond_with(@universities)
  end
end


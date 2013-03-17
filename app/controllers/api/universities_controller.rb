class Api::UniversitiesController < Api::ApplicationController
  def index
    term = params[:term].mb_chars.downcase
    users = User.like_by_university term
    @universities = users.map(&:university).uniq
    respond_with(@universities)
  end
end


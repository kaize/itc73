class Api::UniversitiesController < Api::ApplicationController
  skip_before_filter :api_authenticate!
  def index
    term = params[:term].mb_chars.downcase
    users = User.like_by_university term
    @universities = users.map(&:university).uniq
    respond_with(@universities)
  end
end


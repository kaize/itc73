class Api::TimepadMaillistsController < Api::ApplicationController
  before_filter :api_authenticate!

  def import
    TimepadMaillistsImporter.run
    @lists = TimepadMaillist.all
    respond_with @lists
  end
end

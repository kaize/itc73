class Api::TimepadMaillistsController < Api::ApplicationController
  respond_to :json

  def import
    TimepadMaillistsImporter.run
    @lists = TimepadMaillist.all

    respond_with @lists
  end
end

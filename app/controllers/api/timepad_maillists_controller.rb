class Api::TimepadMaillistsController < Api::ApplicationController

  def import
    TimepadMaillistsImporter.run
    @lists = TimepadMaillist.all
    respond_with @lists
  end
end

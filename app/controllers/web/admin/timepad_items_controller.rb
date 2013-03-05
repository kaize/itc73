class Web::Admin::TimepadItemsController < Web::Admin::ApplicationController
  def export
    if params[:timepad_maillists][:original_id].present?
      maillist = TimepadMaillist.find_by_original_id params[:timepad_maillists][:original_id]
      if maillist.present?
        TimepadItemsExporter.run maillist.original_id
        flash_success
      else
        flash_error
      end
    else
      flash_notice
    end
    redirect_to :back
  end
end

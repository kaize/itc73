class Web::Admin::TimepadItemsController < Web::Admin::ApplicationController
  def export
    if(params[:timepad_maillists][:id].present?)
      maillist = TimepadMaillist.find params[:timepad_maillists][:id]
      TimepadItemsExporter.run maillist.original_id
      flash_success
    else
      flash_notice
    end
    redirect_to :back
  end
end

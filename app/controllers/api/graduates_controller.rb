class Api::GraduatesController < Api::ApplicationController
  def mass_update_order
    graduate_ids = params[:ids]
    graduates = Graduate.find(graduate_ids)

    graduate_ids.map!(&:to_i);

    graduates.each do |graduate|
      order = graduate_ids.index(graduate.id)
      graduate.update_attribute :order_at, order
    end

    head :ok
  end
end

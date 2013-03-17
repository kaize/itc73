class Api::CourseKindsController < Api::ApplicationController
  before_filter :api_authenticate!
  def mass_update_order
    kind_ids = params[:ids]
    kinds = Course::Kind.find(kind_ids)

    kind_ids.map!(&:to_i);

    kinds.each do |kind|
      order = kind_ids.index(kind.id)
      kind.update_attribute :order_at, order
    end

    head :ok
  end
end

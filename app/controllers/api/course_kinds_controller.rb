class Api::CourseKindsController < Api::ApplicationController
  def mass_update_order
    kind_ids = params[:ids]
    kinds = Course::Kind.find(kind_ids)

    kind_ids.map!(&:to_i);

    kinds.each do |kind|
      order = kind_ids.index(kind.id)
      kind.order_at = order
      kind.save
    end

    head :ok
  end
end

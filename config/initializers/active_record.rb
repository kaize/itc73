#This patch is for updating state in nested models by state_event, using dirtying current nested model 
class ActiveRecord::Base 
  def changed?
    super || (respond_to?(:state_event) && state_event.present?)
  end
end


class Material::File < ActiveRecord::Base
  attr_accessible :file

  mount_uploader :file, MaterialFileUploader
end

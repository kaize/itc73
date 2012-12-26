class OrganizerImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "system/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
   %w(jpg jpeg gif png)
  end

end

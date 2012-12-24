# encoding: utf-8

class NewsImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "system/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_limit: [300, 400]

  version :thumb do
    process resize_to_fill: [90, 120]
  end

  def extension_white_list
   %w(jpg jpeg gif png)
  end

end
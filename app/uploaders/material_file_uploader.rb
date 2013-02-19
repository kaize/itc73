# encoding: utf-8
class MaterialFileUploader < CarrierWave::Uploader::Base

  CarrierWave::SanitizedFile.sanitize_regexp = /[^a-zA-Zа-яА-ЯёЁ0-9\.\-\+_]/u
  storage :file

  def store_dir
    "uploads/system/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
   %w(zip 7z rar tar gz bz2 doc docx xls xlsx odt ods txt rtf pdf ppt pptx pages key odp)
  end
end

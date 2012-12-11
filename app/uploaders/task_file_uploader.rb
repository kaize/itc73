# encoding: utf-8

class TaskFileUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    "uploads/system/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
   %w(zip 7z rar tar gz bz2 doc docx xls xlsx odt ods txt rtf pdf)
  end
end

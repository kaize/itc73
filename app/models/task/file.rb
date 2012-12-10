class Task::File < ActiveRecord::Base
  attr_accessible :file

  mount_uploader :file, TaskFileUploader
end

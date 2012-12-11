class Task::File < ActiveRecord::Base
  belongs_to :task

  attr_accessible :file, :task, :task_id

  mount_uploader :file, TaskFileUploader

  def name
    @name ||= File.basename file.url
  end
end

class CourseType < Course
  include BaseType

  attr_accessible :materials_attributes, :tasks_attributes

  accepts_nested_attributes_for :materials, :tasks, allow_destroy: true
end

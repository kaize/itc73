module ApplicationHelper
  include CustomUrlHelper

  def user_state_label(user)
    cls = "label label-user-#{user.state_name}"
    content_tag(:span, user.human_state_name, { class: cls })
  end

  def system_pages
    Page.where(slug: configus.page_slugs).asc_by_name
  end
  def course_kinds
    Course::Kind.with_courses
  end
  def course_level(kind)
    Course::Level.with_kind(kind)
  end
  def courses_in_main_list(level)
    level.courses.select{|c| !current_user.courses.include?(c)}
  end
end

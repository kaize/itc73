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
  def levels_for_kind(kind)
    Course::Level.with_kind(kind)
  end
  def courses_in_main_list(level)
    level.courses - current_user.courses
  end
  def can_interact_with_course?(course, action)
    (course.published? && (course.allowed? || course.denied? && action.eql?("unscribe")))
  end
  def header_needed?(level) 
    signed_in? && courses_in_main_list(level).any? || !signed_in? && level.courses.any?
  end
  def item_needed?(course, level)
    signed_in? && courses_in_main_list(level).include?(course) || !signed_in?
  end
  def active_item?(h)
    hash = send "hash_for_#{h}_path"
    params[:controller] == hash[:controller]
  end
end

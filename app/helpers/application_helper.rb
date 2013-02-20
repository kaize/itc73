module ApplicationHelper

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
  def courses_for_level(kind)
    Course::Level.with_kind(kind)
  end
  def courses_in_main_list(level)
    level.courses - current_user.courses
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
  def form_attributes(course)
    action = "unscribe" 
    style = 'btn btn-danger pull-right'
    unless (current_user.courses.include?(course)) then
      action = "subscribe"
      style = 'btn btn-info pull-right'
    end
    path = send "#{action}_course_user_path"
    {:action => action, :style => style, :path => path}
  end
end

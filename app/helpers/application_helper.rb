module ApplicationHelper
  def user_state_label(user)
    cls = "label label-user-#{user.state_name}"
    content_tag(:span, user.human_state_name, { class: cls })
  end

  def system_pages
    Page.where(slug: configus.page_slugs).asc_by_name
  end

  configus.page_slugs.each do |slug|
    define_method "#{slug}_path" do
      page_path slug
    end
  end
end

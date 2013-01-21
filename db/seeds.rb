admin = User.find_by_email configus.admin.email
unless admin
  user = User.create email: configus.admin.email, password: configus.admin.password, 
    first_name: configus.admin.first_name, last_name: configus.admin.last_name
  user.fire_state_event(:activate)
  user.admin = true
  user.save!
end

configus.page_slugs.each do |slug|
  page = Page.find_or_initialize_by_slug slug
  page.name ||= slug.to_s.camelize
  page.save!
end


admin = User.find_by_email configus.admin.email
unless admin
  User.create email: configus.admin.email, password: configus.admin.password,
    state: :active, admin: true
end

configus.page_slugs.each do |slug|
  page = Page.find_or_initialize_by_slug slug
  page.name ||= slug.to_s.camelize
  page.save!
end


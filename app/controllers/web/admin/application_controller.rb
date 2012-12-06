class Web::Admin::ApplicationController < Web::ApplicationController
  before_filter :authenticate_admin!

  add_breadcrumb :index, :admin_root_path
end

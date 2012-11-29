class Web::WelcomeController < Web::ApplicationController
  def show
    @page = Page.index
  end
end

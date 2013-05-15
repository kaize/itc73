class Web::WelcomeController < Web::ApplicationController
  def show
    @page = Page.index
    title t('.pages_in_titles.main')
  end
end

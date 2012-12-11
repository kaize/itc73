class Web::ApplicationController < ApplicationController
  include FlashHelper

  add_breadcrumb :index, :root_path

  helper_method :title, :base_title

  private

    def base_title
      t('.base_title')
    end

    def title(part = nil)
      @parts ||= [base_title]
      unless part
        return nil if @parts.blank?
        return @parts.join(' - ')
      end
      @parts << part
    end

end

module BreadcrumbsHelper
  extend ActiveSupport::Concern

  included do
    class << self
      def breadcrumb(name, url, options = {})
        class_name = self.name
        before_filter options do |controller|
          controller.send :breadcrumb, name, url, class_name
        end
      end
    end

    def breadcrumb(name, url, class_name = nil)
      name = breadcrumb_translate(name, class_name) if name.is_a?(Symbol)
      add_breadcrumb name, url.to_s
    end

    def breadcrumb_translate(key, class_name = nil)
      class_name ||= self.class.name

      scope = [:breadcrumbs]
      namespace = class_name.underscore.split('/')
      namespace.last.sub!('_controller', '')
      scope += namespace

      t(key, scope: scope)
    end
  end

end


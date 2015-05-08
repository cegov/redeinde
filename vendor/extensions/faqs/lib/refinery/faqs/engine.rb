module Refinery
  module Faqs
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Faqs

      engine_name :refinery_faqs

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "faqs"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.faqs_admin_faqs_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/faqs/faq',
            :title => 'question'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Faqs)
      end
    end
  end
end

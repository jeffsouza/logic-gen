module Logicgen
  module Generators
    class ConfigGenerator < Rails::Generators::Base

      def inject_into_application_rb
        insert_into_file "config/application.rb", "    config.autoload_paths += %W(\#{config.root}/app/logic/controllers)\n", :after => "class Application < Rails::Application\n"
      end

    end
  end
end
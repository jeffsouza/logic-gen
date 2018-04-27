module Logicgen
  module Generators
    class ConfigGenerator < Rails::Generators::Base

      def inject_into_application_rb
        insert_into_file "config/application.rb", :after => "class Application < Rails::Application\n" do
          str = "    config.autoload_paths += %W(\#{config.root}/app/logic/controllers)\n"
          str += "    config.autoload_paths += %W(\#{config.root}/app/logic/models)\n"
        end
        
      end

    end
  end
end
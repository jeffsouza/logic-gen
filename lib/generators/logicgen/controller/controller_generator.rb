module Logicgen
  module Generators
    class ControllerGenerator < Rails::Generators::Base
      class_option :name, type: :string, default: ''

      def begin
        raise NameError.new("Nome do controller é obrigatório") if options.name.blank?
        @name = options.name
        @controller_name = options.name
        @controller_class = "#{@controller_name.capitalize}Controller"
        @logic_class ="#{@controller_class}Logic"
        @logic_class_file = "#{@controller_name}_controller_logic.rb"
      end

      def inject_to_controller
        begin
          inject_into_class "app/controllers/#{@controller_name}_controller.rb", @controller_class, "  include #{@logic_class}\n"
        rescue NameError
          puts "Something went wrong, make sure you run 'rails g logicgen:config'"
        end
      end

      def create_controller_logic_file
        create_file "app/logic/controllers/#{@logic_class_file}", "module #{@logic_class}\nend"
      end

    end
  end
end
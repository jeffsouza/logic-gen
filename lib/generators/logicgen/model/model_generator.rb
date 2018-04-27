module Logicgen
  module Generators
    class ModelGenerator < Rails::Generators::Base
      class_option :name, type: :string, default: ''

      def begin
        raise NameError.new("Nome do model é obrigatório") if options.name.blank?
        @model_name = options.name.singularize
        @model_class = @model_name.split("_").map(&:capitalize).join
        @logic_class ="#{@model_class}Logic"
        @logic_class_file = "#{@model_name}_logic.rb"
      end

      def inject_to_controller
        begin
          inject_into_class "app/models/#{@model_name}.rb", @model_class, "  include #{@logic_class}\n"
        rescue NameError
          puts "Something went wrong, make sure you run 'rails g logicgen:config'"
        end
      end

      def create_controller_logic_file
        create_file "app/logic/models/#{@logic_class_file}", "module #{@logic_class}\nend"
      end

    end
  end
end
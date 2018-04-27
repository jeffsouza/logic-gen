module Logicgen
  module Generators
    class MailerGenerator < Rails::Generators::Base
      class_option :name, type: :string, default: ''

      def begin
        raise NameError.new("Nome do mailer é obrigatório") if options.name.blank?
        @mailer_name = options.name.singularize
        @mailer_class = "#{@mailer_name}_mailer".split("_").map(&:capitalize).join
        @logic_class ="#{@mailer_class}Logic"
        @logic_class_file = "#{@mailer_name}_logic.rb"
      end

      def inject_to_mailer
        begin
          inject_into_class "app/mailers/#{@mailer_name}.rb", @mailer_class, "  include #{@logic_class}\n"
        rescue NameError
          puts "Something went wrong, make sure you run 'rails g logicgen:config'"
        end
      end

      def create_mailer_logic_file
        create_file "app/logic/mailers/#{@logic_class_file}", "module #{@logic_class}\nend"
      end

    end
  end
end
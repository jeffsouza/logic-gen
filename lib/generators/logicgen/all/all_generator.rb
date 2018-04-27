module Logicgen
  module Generators
    class AllGenerator < Rails::Generators::Base

      def create_controller_logic_file
        create_file "app/logic/controllers/post_logic.rb", "class PostLogic\nend"
      end

      def inject_to_controller
        inject_into_class 'app/controllers/post_controller.rb', PostController, "  include PostLogic\n"
      end

    end
  end
end
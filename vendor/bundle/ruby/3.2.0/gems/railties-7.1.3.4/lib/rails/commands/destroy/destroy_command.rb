# frozen_string_literal: true

require "rails/generators"

module Rails
  module Command
    class DestroyCommand < Base # :nodoc:
      no_commands do
        def help
          boot_application!
          load_generators

          Rails::Generators.help self.class.command_name
        end
      end

      desc "destroy GENERATOR", "Remove code generated by `bin/rails generate`"
      def perform(*)
        generator = args.shift
        return help unless generator

        boot_application!
        load_generators

        Rails::Generators.invoke generator, args, behavior: :revoke, destination_root: Rails::Command.root
      end
    end
  end
end

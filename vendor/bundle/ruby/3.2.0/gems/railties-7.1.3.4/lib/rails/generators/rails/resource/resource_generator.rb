# frozen_string_literal: true

require "rails/generators/resource_helpers"
require "rails/generators/rails/model/model_generator"

module Rails
  module Generators
    class ResourceGenerator < ModelGenerator # :nodoc:
      include ResourceHelpers

      hook_for :resource_controller, required: true do |controller|
        invoke controller, [ controller_name, options[:actions] ]
      end

      class_option :actions, type: :array, banner: "ACTION ACTION", default: [],
                             desc: "Actions for the resource controller"

      hook_for :resource_route, required: true

      class << self
        def desc(description = nil)
          ERB.new(File.read(usage_path)).result(binding)
        end
      end
    end
  end
end

# frozen_string_literal: true

require "rails/generators/model_helpers"

module Rails
  module Generators
    class ModelGenerator < NamedBase # :nodoc:
      include Rails::Generators::ModelHelpers

      argument :attributes, type: :array, default: [], banner: "field[:type][:index] field[:type][:index]"
      hook_for :orm, required: true, desc: "ORM to be invoked"

      class << self
        delegate(:desc, to: :orm_generator)
      end
    end
  end
end

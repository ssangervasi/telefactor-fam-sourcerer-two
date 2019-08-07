# frozen_string_literal: true
require 'fam/file'
require 'fam/cli'

module Fam
  module Meta
    def self.included(base)
      # Includes the .success and .failure helpers which return Fam::CLI::Result objects
      #   that the CLI knows how to handle. All of the module methods should return
      #   either `success(message)` or `failure(message)`, but how they do that
      #   is up to the sourcerer.
      base.extend Fam::CLI::Result::Helpers
      base.extend Fam::File::Helpers

      def base.cli(method_name, args: [], reskew: [], dew: -> {})
        define_singleton_method(method_name) do |**kwargs|
          people = read path: kwargs.delete(:input_path)
          family = Family.new family: people

          success(dew.call(**kwargs.slice(*args), family: family))
        rescue *reskew => e
          failure e.message
        end
      end
    end
  end
end

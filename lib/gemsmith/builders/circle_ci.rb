# frozen_string_literal: true

require "refinements/structs"

module Gemsmith
  module Builders
    # Builds project skeleton Circle CI configuration.
    class CircleCI
      using Refinements::Structs

      def self.call(...) = new(...).call

      def initialize configuration, builder: Rubysmith::Builder
        @configuration = configuration
        @builder = builder
      end

      def call
        return configuration unless configuration.build_circle_ci

        builder.call(configuration.merge(template_path: "%project_name%/.circleci/config.yml.erb"))
               .replace %({{checksum "Gemfile.lock"}}),
                        %({{checksum "Gemfile"}}-{{checksum "#{project_name}.gemspec"}})

        configuration
      end

      private

      attr_reader :configuration, :builder

      def project_name = configuration.project_name
    end
  end
end

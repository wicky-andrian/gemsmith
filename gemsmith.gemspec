# frozen_string_literal: true

require_relative "lib/gemsmith/identity"

Gem::Specification.new do |spec|
  spec.name = Gemsmith::Identity::NAME
  spec.version = Gemsmith::Identity::VERSION
  spec.platform = Gem::Platform::RUBY
  spec.authors = ["Brooke Kuhlmann"]
  spec.email = ["brooke@alchemists.io"]
  spec.homepage = "https://www.alchemists.io/projects/gemsmith"
  spec.summary = "A command line interface for smithing new Ruby gems."
  spec.license = "Apache-2.0"

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/bkuhlmann/gemsmith/issues",
    "changelog_uri" => "https://www.alchemists.io/projects/gemsmith/changes.html",
    "documentation_uri" => "https://www.alchemists.io/projects/gemsmith",
    "source_code_uri" => "https://github.com/bkuhlmann/gemsmith"
  }

  spec.signing_key = Gem.default_key_path
  spec.cert_chain = [Gem.default_cert_path]

  spec.required_ruby_version = "~> 2.7"
  spec.add_dependency "milestoner", "~> 10.0"
  spec.add_dependency "pragmater", "~> 7.0"
  spec.add_dependency "refinements", "~> 7.0"
  spec.add_dependency "rubocop", "~> 0.83"
  spec.add_dependency "runcom", "~> 6.0"
  spec.add_dependency "thor", "~> 0.20"
  spec.add_dependency "tocer", "~> 10.0"
  spec.add_dependency "versionaire", "~> 8.0"
  spec.add_development_dependency "bundler-audit", "~> 0.6"
  spec.add_development_dependency "climate_control", "~> 0.2"
  spec.add_development_dependency "git-cop", "~> 4.0"
  spec.add_development_dependency "guard-rspec", "~> 4.7"
  spec.add_development_dependency "pry", "~> 0.13"
  spec.add_development_dependency "pry-byebug", "~> 3.9"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "reek", "~> 6.0"
  spec.add_development_dependency "rspec", "~> 3.9"
  spec.add_development_dependency "rubocop-performance", "~> 1.5"
  spec.add_development_dependency "rubocop-rake", "~> 0.5"
  spec.add_development_dependency "rubocop-rspec", "~> 1.39"
  spec.add_development_dependency "simplecov", "~> 0.18"

  spec.files = Dir.glob "lib/**/*", File::FNM_DOTMATCH
  spec.extra_rdoc_files = Dir["README*", "LICENSE*"]
  spec.executables << "gemsmith"
  spec.require_paths = ["lib"]
end

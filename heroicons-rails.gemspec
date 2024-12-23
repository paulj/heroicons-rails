require_relative "lib/heroicons-rails/version"

Gem::Specification.new do |spec|
  spec.name        = "heroicons-rails"
  spec.version     = HeroiconsRails::VERSION
  spec.authors     = ["Paul Jones"]
  spec.email       = ["pauljones23@gmail.com"]
  spec.homepage    = "https://github.com/paulj/heroicons-rails"
  spec.summary     = "Heroicons for Rails apps"
  spec.description = "View Components for Rails apps based upon Heroicons."
  spec.license     = "Proprietary"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.pkg.github.com/paulj"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/paulj/heroicons-rails"
  spec.metadata["changelog_uri"] = "https://github.com/paulj/heroicons-rails/blob/master/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{lib}/**/*", "Rakefile", "README.md"]
  end

  spec.add_dependency "view_component", ">= 3.12.1"
  spec.add_dependency "nokogiri", ">= 1.17"
end

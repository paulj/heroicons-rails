task :fetch do
  require_relative "lib/heroicons-rails/version"

  system("curl -L -s -o heroicons.tar.gz https://github.com/tailwindlabs/heroicons/archive/refs/tags/v#{HeroiconsRails::HEROICONS_VERSION}.tar.gz")
  system("tar -xzf heroicons.tar.gz")

  rm_r "lib/heroicons-rails/icons"
  mv "heroicons-#{HeroiconsRails::HEROICONS_VERSION}/src", "lib/heroicons-rails/icons"
  rm_rf "heroicons-#{HeroiconsRails::HEROICONS_VERSION}"
  rm "heroicons.tar.gz"
end


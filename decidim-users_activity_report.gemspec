require_relative "lib/decidim/users_activity_report/version"

Gem::Specification.new do |spec|
  spec.name        = "decidim-users_activity_report"
  spec.version     = Decidim::UsersActivityReport::VERSION
  spec.authors     = ["VictorJorgeFGA"]
  spec.email       = ["victor.eng.unb@gmail.com"]
  spec.homepage    = "TODO"
  spec.summary     = "Add users activity report to participatory spaces."
  spec.license     = "AGPLv3"
  spec.description =
  <<~DESC
  This gem add users activity report to participatory spaces, providing a facilitated way to configure reports for each
  participatory space and displaying them later. By adding this gem inside your Decidim project, it will allow you to
  monitore users interaction with the participatory space components and also have a user scoreboard where each type of
  interaction will contribute differently to user score, and of course, you define that too.
  DESC

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://gitlab.com/lappis-unb/decidimbr/decidim-users_activity_report"
  spec.metadata["changelog_uri"] = "https://gitlab.com/lappis-unb/decidimbr/decidim-users_activity_report/CHANGELOG.md"

  spec.files = Dir["{app,config,db,lib}/**/*", "LICENSE-AGPLv3.txt", "Rakefile", "README.md"]

  s.add_dependency "decidim-admin", Decidim::UsersActivityReport::COMPAT_DECIDIM_VERSION
  s.add_dependency "decidim-core", Decidim::UsersActivityReport::COMPAT_DECIDIM_VERSION

  s.add_development_dependency "decidim-dev", Decidim::UsersActivityReport::COMPAT_DECIDIM_VERSION
end

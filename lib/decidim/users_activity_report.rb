require "decidim/users_activity_report/version"
require "decidim/users_activity_report/engine"
require "decidim/users_activity_report/admin"
require "decidim/users_activity_report/admin_engine"

Decidim.register_global_engine(
  :decidim_users_activity_report, # this is the name of the global method to access engine routes
  ::Decidim::UsersActivityReport::Engine,
  at: "/users_activity_report"
)

module Decidim
  module UsersActivityReport
    # Your code goes here...
  end
end



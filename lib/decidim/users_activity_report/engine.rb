require 'rails'
require 'decidim/core'

module Decidim
  module UsersActivityReport
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::UsersActivityReport

      routes do
        # Portal routes go here
      end

      initializer "decidim_users_activity_report.webpacker.assets_path" do
        Decidim.register_assets_path File.expand_path("app/packs", root)
      end
    end
  end
end

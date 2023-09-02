# frozen_string_literal: true

module Decidim
  module UsersActivityReport
    # This is the engine that runs on the public interface of `decidim-users_activity_report`.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::UsersActivityReport::Admin

      paths["db/migrate"] = nil
      paths["lib/tasks"] = nil

      routes do
        # Admin routes go here
      end

      initializer "decidim_users_activity_report.admin_mount_routes" do
        Decidim::Core::Engine.routes do
          mount Decidim::UsersActivityReport::AdminEngine, at: '/admin/decidim_users_activity_report', as: "decidim_admin_users_activity_report"
        end
      end

      def load_seed
        nil
      end
    end
  end
end
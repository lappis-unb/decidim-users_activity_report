Rails.application.routes.draw do
  mount Decidim::UsersActivityReport::Engine => "/decidim-users_activity_report"
end

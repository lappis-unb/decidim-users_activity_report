module Decidim
  module UsersActivityReport
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end

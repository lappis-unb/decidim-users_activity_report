module Decidim::UsersActivityReport
  class ComponentReportConfig < ApplicationRecord
    belongs_to :component, class_name: 'Decidim::Component'
    belongs_to :report_config, inverse_of: :component_report_configs
    serialize :used_fields, Array

    def updated_data; end
    def self.available_fields; end
  end
end

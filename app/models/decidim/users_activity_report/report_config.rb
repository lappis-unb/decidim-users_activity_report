module Decidim::UsersActivityReport
  class ReportConfig < ApplicationRecord
    has_many :component_report_configs, inverse_of: :report_config

    def all_data
      @all_data ||= all_updated_data
    end

    def all_updated_data
      component_report_configs.map(&:updated_data).reduce(:+).group_by { |cpc| cpc['decidim_user_id'].itself }.map do |user_data|

      end
    end

    def refresh_data!

    end
  end
end

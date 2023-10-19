class CreateDecidimUsersActivityReportProposalReportConfigs < ActiveRecord::Migration[6.1]
  def change
    create_table :decidim_users_activity_report_proposal_report_configs do |t|
      t.text :used_fields

      t.timestamps
    end
  end
end

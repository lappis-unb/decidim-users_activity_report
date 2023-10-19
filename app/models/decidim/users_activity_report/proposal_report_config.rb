module Decidim::UsersActivityReport
  class ProposalReportConfig < ApplicationRecord
    serialize :used_fields, Array

    def available_fields
      %w[
        proposals_done
        comments_done
        votes_done
        follows_done
        votes_received
        comments_received
        follows_received
        score
      ]
    end
  end
end

module Decidim::UsersActivityReport
  class ProposalReportConfig < Decidim::UsersActivityReport::ComponentReportConfig
    def updated_data
      authorship_data + comments_data + votes_data + follows_data
    end

    def self.available_fields
      %i[
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

    private

    def authorship_data
      ActiveRecord::Base.connection.execute(
        <<~SQL.squish
        (SELECT du.id as decidim_user_id, COUNT(dpp.id) as proposals_done, SUM(dpp.proposal_votes_count) as votes_received, SUM(dpp.comments_count) as comments_received, SUM(dpp.follows_count) as follows_received
          FROM decidim_components as dc
          INNER JOIN decidim_proposals_proposals as dpp
            ON dc.id = dpp.decidim_component_id AND dpp.decidim_component_id = #{component.id}
          INNER JOIN decidim_coauthorships as coauth
            ON coauth.coauthorable_type = 'Decidim::Proposals::Proposal' AND coauth.coauthorable_id = dpp.id
          INNER JOIN decidim_users as du
            ON du.id = coauth.decidim_author_id
        GROUP BY du.id)
        SQL
      )
    end

    def comments_data
      ActiveRecord::Base.connection.execute(
        <<~SQL.squish
        SELECT du.id as decidim_user_id, COUNT(dcc.id) as comments_done
          FROM decidim_components as dc
          INNER JOIN decidim_proposals_proposals as dpp
            ON dc.id = dpp.decidim_component_id AND dpp.decidim_component_id = #{component.id}
          INNER JOIN decidim_comments_comments as dcc
            ON dcc.decidim_commentable_id = dpp.id
          INNER JOIN decidim_users as du
            ON du.id = dcc.decidim_author_id
          WHERE dcc.decidim_commentable_type = 'Decidim::Proposals::Proposal'
        GROUP BY du.id
        SQL
      )
    end

    def votes_data
      ActiveRecord::Base.connection.execute(
        <<~SQL.squish
        SELECT du.id as decidim_user_id, COUNT(dppv.id) as votes_done
          FROM decidim_components as dc
          INNER JOIN decidim_proposals_proposals as dpp
            ON dc.id = dpp.decidim_component_id AND dpp.decidim_component_id = #{component.id}
          INNER JOIN decidim_proposals_proposal_votes as dppv
            ON dppv.decidim_proposal_id = dpp.id
          INNER JOIN decidim_users as du
            ON du.id = dppv.decidim_author_id
        GROUP BY du.id
        SQL
      )
    end

    def follows_data
      ActiveRecord::Base.connection.execute(
        <<~SQL.squish
        SELECT du.id as decidim_user_id, COUNT(df.id) as follows_done
          FROM decidim_components as dc
          INNER JOIN decidim_proposals_proposals as dpp
            ON dc.id = dpp.decidim_component_id AND dpp.decidim_component_id = #{component.id}
          INNER JOIN decidim_follows as df
            ON df.decidim_followable_id = dpp.id
          INNER JOIN decidim_users as du
            ON du.id = df.decidim_user_id
          WHERE df.decidim_followable_type = 'Decidim::Proposals::Proposal'
        GROUP BY du.id
        SQL
      )
    end
  end
end

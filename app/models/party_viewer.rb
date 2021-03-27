class PartyViewer < ApplicationRecord
  belongs_to :party
  belongs_to :viewer, class_name: 'User'

  def self.create_multiple_viewers(ids, party_id)
    return '' if ids.nil?

    ids.each do |viewer_id|
      if viewer_id != ''
        PartyViewer.create!(party_id: party_id, viewer_id: viewer_id)
      end
    end
  end
end

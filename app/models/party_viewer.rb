class PartyViewer < ApplicationRecord
  belongs_to :party_id
  belongs_to :viewer_id
end

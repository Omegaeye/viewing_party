class PartyViewer < ApplicationRecord
  belongs_to :party
  belongs_to :viewer, class_name: 'User', foreign_key: 'viewer_id'
end

class Party < ApplicationRecord
  belongs_to :movie_id
  belongs_to :host_id
end

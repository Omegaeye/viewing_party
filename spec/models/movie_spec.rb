require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title}
    it { should validate_presence_of :api_id}
    it { should validate_numericality_of(:duration).is_greater_than_or_equal_to(0) }
  end

  describe 'relationships' do
    it { should have_many :parties }
    it { should have_many(:party_viewers).through(:parties) }
  end
end

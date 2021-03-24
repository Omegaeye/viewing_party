require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'validations' do
    it { should validate_numericality_of(:duration).is_greater_than_or_equal_to(0) }
  end

  describe 'relationships' do
    it { should belong_to :movie }
    it { should belong_to(:host).class_name('User').with_foreign_key('host_id') }
    it { should have_many :party_viewers }
  end
end

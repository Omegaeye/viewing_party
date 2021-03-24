require 'rails_helper'

RSpec.describe PartyViewer, type: :model do
  describe 'validations' do
  end

  describe 'relationships' do
    it { should belong_to :party }
    it { should belong_to(:viewer).class_name('User').with_foreign_key('viewer_id') }
  end
end

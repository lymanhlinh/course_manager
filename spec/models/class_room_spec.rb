require 'rails_helper'

RSpec.describe ClassRoom, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:courses) }
  end
end

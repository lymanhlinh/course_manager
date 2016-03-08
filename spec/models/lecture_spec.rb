require 'rails_helper'

RSpec.describe Lecture, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:courses).dependent(:destroy) }
  end
end

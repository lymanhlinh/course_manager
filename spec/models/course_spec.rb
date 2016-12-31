require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:staff) }
    it { is_expected.to have_many(:lessons).dependent(:destroy) }
    it { is_expected.to have_many(:course_instances).dependent(:destroy) }
  end
end

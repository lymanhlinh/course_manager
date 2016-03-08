require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:class_room) }
    it { is_expected.to belong_to(:redactor) }
    it { is_expected.to have_many(:lessons).dependent(:destroy) }
    it { is_expected.to have_and_belong_to_many(:students) }
  end
end

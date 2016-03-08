require 'rails_helper'

RSpec.describe Lesson, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:course) }
    it { is_expected.to have_many(:lesson_videos).dependent(:destroy) }
  end
end

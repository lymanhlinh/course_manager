require 'rails_helper'

RSpec.describe LessonVideo, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:lesson) }
  end
end

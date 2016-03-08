require 'rails_helper'

RSpec.describe Redactor, type: :model do
  describe 'association' do
    it { is_expected.to have_many(:courses).dependent(:destroy) }
  end
end

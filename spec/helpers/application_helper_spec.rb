require 'rails_helper'

describe ApplicationHelper do
  describe 'flash_message' do
    context 'message is a string' do
      let(:message) { 'My message' }

      it 'returns correct html content' do
        expect(helper.flash_message(message)).to eq(message.html_safe)
      end
    end

    context 'message is not string' do
      let(:message) { { first: '1st', second: '2nd' } }

      it 'returns string representing the message' do
        expect(helper.flash_message(message)).to eq(message.to_s)
      end
    end
  end
end

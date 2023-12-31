# frozen_string_literal: true
# rubocop:todo all

require 'spec_helper'

describe Mongo::WriteConcern::Unacknowledged do

  let(:concern) do
    described_class.new(:w => 0)
  end

  describe '#get_last_error' do

    it 'returns nil' do
      expect(concern.get_last_error).to be_nil
    end
  end

  describe '#acknowledged?' do

    let(:concern) do
      described_class.new(:w => 0)
    end

    it 'returns false' do
      expect(concern.acknowledged?).to be(false)
    end
  end
end

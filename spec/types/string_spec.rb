require 'spec_helper'

describe Notions::Types::String do
  describe '#read_only?' do
    it 'returns true' do
      expect(subject.read_only?).to be(true)
    end
  end

  describe '#deserialize' do
    let(:property_fragment) do
      {
        'type' => 'string',
        'string' => 'foobar'
      }
    end

    context 'without a string key' do
      let(:property_fragment) do
        {
          'type' => 'checkbox',
          'checkbox' => true
        }
      end

      it 'raises an error' do
        expect do
          subject.deserialize(property_fragment)
        end.to raise_error(KeyError)
      end
    end

    it 'returns a string' do
      expect(subject.deserialize(property_fragment)).to eq('foobar')
    end
  end
end

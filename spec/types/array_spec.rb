require 'spec_helper'

describe Notions::Types::Array do
  describe '#read_only?' do
    it 'return true' do
      expect(subject.read_only?).to be(true)
    end
  end

  describe '#deserialize' do
    let(:property_fragment) do
      {
        'type' => 'array',
        'array' => [
          {
            'type' => 'checkbox',
            'checkbox' => true
          },
          {
            'type' => 'checkbox',
            'checkbox' => false
          }
        ],
        'function' => 'show_original'
      }
    end

    context 'without an array key' do
      let(:property_fragment) do
        {
          'type' => 'checkbox',
          'checkbox' => false
        }
      end

      it 'raises an error' do
        expect do
          subject.deserialize(property_fragment)
        end.to raise_error(KeyError)
      end
    end

    context 'with an empty array' do
      let(:property_fragment) do
        {
          'type' => 'array',
          'array' => [],
          'function' => 'show_original'
        }
      end

      it 'returns an empty array' do
        expect(subject.deserialize(property_fragment)).to eq([])
      end
    end

    it 'returns an array of items deserialized using their nested type' do
      expect(subject.deserialize(property_fragment)).to eq([true, false])
    end
  end
end

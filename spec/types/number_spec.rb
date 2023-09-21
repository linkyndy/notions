require 'spec_helper'

describe Notions::Types::Number do
  describe '#serialize' do
    it 'returns a property fragment' do
      expect(subject.serialize(123)).to match('number' => 123)
    end
  end

  describe '#deserialize' do
    let(:property_fragment) do
      {
        'type' => 'number',
        'number' => 123
      }
    end

    context 'without a number key' do
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

    it 'returns a number' do
      expect(subject.deserialize(property_fragment)).to eq(123)
    end
  end
end

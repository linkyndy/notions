require 'spec_helper'

describe Notions::Types::PhoneNumber do
  describe '#serialize' do
    it 'returns a property fragment' do
      expect(subject.serialize('123')).to match('phone_number' => '123')
    end
  end

  describe '#deserialize' do
    let(:property_fragment) do
      {
        'type' => 'phone_number',
        'phone_number' => '123'
      }
    end

    context 'without a phone_number key' do
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
      expect(subject.deserialize(property_fragment)).to eq('123')
    end
  end
end

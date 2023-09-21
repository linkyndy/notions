require 'spec_helper'

describe Notions::Types::Checkbox do
  describe '#serialize' do
    it 'returns a property fragment' do
      expect(subject.serialize(true)).to match('checkbox' => true)
    end
  end

  describe '#deserialize' do
    let(:property_fragment) do
      {
        'type' => 'checkbox',
        'checkbox' => true
      }
    end

    context 'without a checkbox key' do
      let(:property_fragment) do
        {
          'type' => 'email',
          'email' => 'foo@bar.baz'
        }
      end

      it 'raises an error' do
        expect do
          subject.deserialize(property_fragment)
        end.to raise_error(KeyError)
      end
    end

    it 'returns a booolean' do
      expect(subject.deserialize(property_fragment)).to eq(true)
    end
  end
end

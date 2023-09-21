require 'spec_helper'

describe Notions::Types::Email do
  describe '#serialize' do
    it 'returns a property fragment' do
      expect(subject.serialize('foo@bar.baz')).to match('email' => 'foo@bar.baz')
    end
  end

  describe '#deserialize' do
    let(:property_fragment) do
      {
        'type' => 'email',
        'email' => 'foo@bar.baz'
      }
    end

    context 'without an email key' do
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
      expect(subject.deserialize(property_fragment)).to eq('foo@bar.baz')
    end
  end
end

require 'spec_helper'

describe Notions::Types::Url do
  describe '#serialize' do
    it 'returns a property fragment' do
      expect(subject.serialize('http://foo.bar')).to match('url' => 'http://foo.bar')
    end
  end

  describe '#deserialize' do
    let(:property_fragment) do
      {
        'type' => 'url',
        'url' => 'http://foo.bar'
      }
    end

    context 'without a url key' do
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
      expect(subject.deserialize(property_fragment)).to eq('http://foo.bar')
    end
  end
end

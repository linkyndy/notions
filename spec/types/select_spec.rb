require 'spec_helper'

describe Notions::Types::Select do
  describe '#serialize' do
    it 'returns a property fragment' do
      expect(subject.serialize('foobar')).to match('select' => { 'name' => 'foobar' })
    end
  end

  describe '#deserialize' do
    let(:property_fragment) do
      {
        'type' => 'select',
        'select' => {
          'name' => 'foobar'
        }
      }
    end

    context 'without a select key' do
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

require 'spec_helper'

describe Notions::Client do
  before do
    allow(Notions.configuration).to receive(:access_token).and_return('foobar')
  end

  describe '#get_page' do
    before do
      stub_request(:get, 'https://api.notion.com/v1/pages/123').to_return(
        body: { 'foo' => 'bar' }.to_json,
        headers: { 'Content-Type': 'application/json' }
      )
    end

    it 'sends a request to Notion' do
      subject.get_page(123)
      expect(
        a_request(:get, 'https://api.notion.com/v1/pages/123').with(
          headers: {
            'Authorization' => 'Bearer foobar',
            'Notion-Version' => '2022-06-28'
          }
        )).to have_been_made
    end

    context 'when the Notion request fails' do
      before do
        stub_request(:get, 'https://api.notion.com/v1/pages/123').to_return(status: 400)
      end

      it 'raises an error' do
        expect do
          subject.get_page(123)
        end.to raise_error(Faraday::BadRequestError)
      end
    end

    context 'when the Notion request gets rate limited' do
      before do
        stub_request(:get, 'https://api.notion.com/v1/pages/123').to_return({
          status: 429,
          headers: { 'Retry-After' => 0.123 }
        }, {
          body: { 'foo' => 'bar' }.to_json,
          headers: { 'Content-Type' => 'application/json' }
        })
      end

      it 'does not raise an error' do
        expect do
          subject.get_page(123)
        end.not_to raise_error
      end

      it 'returns the Notion response' do
        expect(subject.get_page(123)).to match('foo' => 'bar')
      end
    end

    it 'returns the Notion response' do
      expect(subject.get_page(123)).to match('foo' => 'bar')
    end
  end

  describe '#create_page' do
    before do
      stub_request(:post, 'https://api.notion.com/v1/pages').to_return(
        body: { 'foo' => 'bar' }.to_json,
        headers: { 'Content-Type' => 'application/json' }
      )
    end

    it 'sends a request to Notion' do
      subject.create_page(123, 'foo' => 'bar')
      expect(
        a_request(:post, 'https://api.notion.com/v1/pages').with(
          body: {
            parent: {
              database_id: 123
            },
            properties: {
              'foo' => 'bar'
            }
          },
          headers: {
            'Authorization' => 'Bearer foobar',
            'Content-Type' => 'application/json',
            'Notion-Version' => '2022-06-28'
          }
        )).to have_been_made
    end

    context 'when the Notion request fails' do
      before do
        stub_request(:post, 'https://api.notion.com/v1/pages').to_return(status: 400)
      end

      it 'raises an error' do
        expect do
          subject.create_page(123, 'foo' => 'bar')
        end.to raise_error(Faraday::BadRequestError)
      end
    end

    context 'when the Notion request gets rate limited' do
      before do
        stub_request(:post, 'https://api.notion.com/v1/pages').to_return({
          status: 429,
          headers: { 'Retry-After' => 0.123 }
        }, {
          body: { 'foo' => 'bar' }.to_json,
          headers: { 'Content-Type' => 'application/json' }
        })
      end

      it 'does not raise an error' do
        expect do
          subject.create_page(123, 'foo' => 'bar')
        end.not_to raise_error
      end

      it 'returns the Notion response' do
        expect(subject.create_page(123, 'foo' => 'bar')).to match('foo' => 'bar')
      end
    end

    it 'returns the Notion response' do
      expect(subject.create_page(123, 'foo' => 'bar')).to match('foo' => 'bar')
    end
  end

  describe '#update_page' do
    before do
      stub_request(:patch, 'https://api.notion.com/v1/pages/123').to_return(
        body: { 'foo' => 'bar' }.to_json,
        headers: { 'Content-Type' => 'application/json' }
      )
    end

    it 'sends a request to Notion' do
      subject.update_page(123, 'foo' => 'bar')
      expect(
        a_request(:patch, 'https://api.notion.com/v1/pages/123').with(
          body: {
            properties: {
              'foo' => 'bar'
            }
          },
          headers: {
            'Authorization' => 'Bearer foobar',
            'Content-Type' => 'application/json',
            'Notion-Version' => '2022-06-28'
          }
        )).to have_been_made
    end

    context 'when the Notion request fails' do
      before do
        stub_request(:patch, 'https://api.notion.com/v1/pages/123').to_return(status: 400)
      end

      it 'raises an error' do
        expect do
          subject.update_page(123, 'foo' => 'bar')
        end.to raise_error(Faraday::BadRequestError)
      end
    end

    context 'when the Notion request gets rate limited' do
      before do
        stub_request(:patch, 'https://api.notion.com/v1/pages/123').to_return({
          status: 429,
          headers: { 'Retry-After' => 0.123 }
        }, {
          body: { 'foo' => 'bar' }.to_json,
          headers: { 'Content-Type' => 'application/json' }
        })
      end

      it 'does not raise an error' do
        expect do
          subject.update_page(123, 'foo' => 'bar')
        end.not_to raise_error
      end

      it 'returns the Notion response' do
        expect(subject.update_page(123, 'foo' => 'bar')).to match('foo' => 'bar')
      end
    end

    it 'returns the Notion response' do
      expect(subject.update_page(123, 'foo' => 'bar')).to match('foo' => 'bar')
    end
  end

  describe '#delete_page' do
    before do
      stub_request(:patch, 'https://api.notion.com/v1/pages/123').to_return(
        body: { 'foo' => 'bar' }.to_json,
        headers: { 'Content-Type' => 'application/json' }
      )
    end

    it 'sends a request to Notion' do
      subject.delete_page(123)
      expect(
        a_request(:patch, 'https://api.notion.com/v1/pages/123').with(
          body: {
            archived: true
          },
          headers: {
            'Authorization' => 'Bearer foobar',
            'Content-Type' => 'application/json',
            'Notion-Version' => '2022-06-28'
          }
        )).to have_been_made
    end

    context 'when the Notion request fails' do
      before do
        stub_request(:patch, 'https://api.notion.com/v1/pages/123').to_return(status: 400)
      end

      it 'raises an error' do
        expect do
          subject.delete_page(123)
        end.to raise_error(Faraday::BadRequestError)
      end
    end

    context 'when the Notion request gets rate limited' do
      before do
        stub_request(:patch, 'https://api.notion.com/v1/pages/123').to_return({
          status: 429,
          headers: { 'Retry-After' => 0.123 }
        }, {
          body: { 'foo' => 'bar' }.to_json,
          headers: { 'Content-Type' => 'application/json' }
        })
      end

      it 'does not raise an error' do
        expect do
          subject.delete_page(123)
        end.not_to raise_error
      end

      it 'returns the Notion response' do
        expect(subject.delete_page(123)).to match('foo' => 'bar')
      end
    end

    it 'returns the Notion response' do
      expect(subject.delete_page(123)).to match('foo' => 'bar')
    end
  end
end

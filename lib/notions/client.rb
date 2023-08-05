require 'faraday'
require 'faraday/retry'

module Notions
  class Client
    NOTION_URL = 'https://api.notion.com'
    NOTION_VERSION = '2022-06-28'

    def get_page(id)
      response = connection.get("/v1/pages/#{id}")
      response.body
    end

    def create_page(database_id, properties)
      payload = {
        parent: {
          database_id: database_id
        },
        properties: properties
      }
      response = connection.post("/v1/pages", payload)
      response.body
    end

    def update_page(id, properties)
      payload = {
        properties: properties
      }
      response = connection.patch("/v1/pages/#{id}", payload)
      response.body
    end

    def delete_page(id)
      payload = {
        archived: true
      }
      response = connection.patch("/v1/pages/#{id}", payload)
      response.body
    end

    private

    def connection
      @connection ||= Faraday.new(url: NOTION_URL, headers: { 'Notion-Version' => NOTION_VERSION }) do |f|
        f.request :authorization, 'Bearer', Notions.configuration.access_token
        f.request :json
        f.response :json
        f.response :raise_error
        # Make sure we play nicely with Notion's rate limits
        f.request :retry, methods: %i[get post patch], retry_statuses: [429]
        f.response :logger, Notions.logger
      end
    end
  end
end

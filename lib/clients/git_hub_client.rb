# frozen_string_literal: true
# class GitHubClient

#   ROOT_ENDPOINT = 'https://api.github.com'
#   ACCESS_TOKEN = '0c0f44b0395d1a3d0afc5f59cdafdd925d516a92'

#   def initialize
#     @http_client = setup_http_client
#   end

#   def create_gist(params)
#     # нужно помнить, что параметры преданные в params должны быть в json формате
#     @http_client.post('gists') do |request|
#       request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
#       request.headers['Content-Type'] = 'application/json'
#       request.body = params.to_json # преобразуем данные в формат json
#     end
#   end

#   private

#   def setup_http_client
#     # нужен gem 'faraday'
#     Faraday.new(url: ROOT_ENDPOINT)
#   end
# end

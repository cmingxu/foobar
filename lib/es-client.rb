require 'multi_json'
require 'faraday'
require 'elasticsearch/api'
require 'hashie'

class ESClientBase
  include Elasticsearch::API
  attr_accessor :url, :conn

  def initialize url
    @base_url = url
    @conn = ::Faraday::Connection.new url: @base_url
  end


  def perform_request(method, path, params, body)
    puts "  [ES] --> #{method.upcase} #{path} #{params} #{body}"

    @conn.run_request \
      method.downcase.to_sym,
      path,
      ( body ? MultiJson.dump(body): nil ),
      {'Content-Type' => 'application/json'}
  end

  def convert json
    HashWithIndifferentAccess.new(MultiJson.load(json))
  end
end


class ESClient < ESClientBase
  def initialize url
    super url
  end

  def health
    convert self.cluster.health
  end

  def es_search index, query
    convert self.search(index: index, body: MultiJson.load(query))
  end

  def es_index request
    convert self.index(request)
  end

  def es_request index, type, id, body
    {
      index: index,
      type: type,
      id: id,
      body: body
    }
  end

  def es_remove index, type, id
    self.perform_request "DELETE", "#{index}/#{type}/#{id}", nil, nil
  end
end

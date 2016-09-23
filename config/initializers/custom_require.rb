require 'uuid'
require 'es-client'

$esclient = ESClient.new Setting.es_url

unless $esclient.ping
  $stderr.puts "elasticsearch server connect error"
  exit(1)
end

require 'logger'

Dir['./models/helpers/*.rb', './models/*.rb'].each do |file|
  require file
end
require './version'
require './lib/error'
require './lib/server_cipher_auth'
require './lib/config'
require './lib/nebula'
require './lib/api'

$logger = Logger.new(STDOUT)
$logger.formatter = proc do |severity, datetime, _progname, msg|
  date_format = datetime.strftime('%Y-%m-%dT%H:%M:%S%z')
  format("[#{date_format}] %5{severity}: #{msg}\n", severity: severity)
end
$config = Now::Config.new

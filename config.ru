require 'rack'
require './main'

use(Rack::Reloader)

run(Cuba)

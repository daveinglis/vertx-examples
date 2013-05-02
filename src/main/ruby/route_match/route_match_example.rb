# Copyright 2011 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "vertx"
include Vertx

# Inspired from Sinatra / Express
rm = RouteMatcher.new

# Extract the params from the uri
rm.get('/details/:user/:id') { |req| req.response.end("User: #{req.params['user']} ID: #{req.params['id']}") }

# Catch all - serve the index page
rm.get_re('.*') { |req| req.response.send_file("route_match/index.html")}

HttpServer.new.request_handler(&rm.to_proc).listen(8080)
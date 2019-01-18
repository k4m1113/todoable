class Todoable
	# DRYness
	def self.add_common_headers(req_hash)
		token = Todoable::Auth.curr_token
    req_hash['Authorization'] = "Token token=\"#{token}\""
    req_hash['Content-Type'] = "application/json"
    req_hash['Accept'] = "application/json"
		return req_hash
	end

	# net/http wrapper
	def self.request(req_hash)
    begin
    res = Net::HTTP.start(req_hash.uri.hostname, req_hash.uri.port) {|http|
      http.request(req_hash)
    }
    rescue
      puts 'request error'
    end
	end
end


require 'todoable/auth'
require 'todoable/item'
require 'todoable/list'

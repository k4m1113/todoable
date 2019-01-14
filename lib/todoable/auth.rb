require 'net/http'
require 'time'

class Todoable::Auth
  def initialize
    uri = URI('http://todoable.teachable.tech/api/authenticate')
    file = File.stat 'authenticate'
    req = Net::HTTP::Post.new(uri)
    req.basic_auth 'kamilledelgardo@gmail.com', 'todoable'
    req['If-Modified-Since'] = file.mtime.rfc2822
    req['Content-Type'] = "application/json"
    req['Accept'] = "application/json"

    res = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(req)
    }

    open 'authenticate', 'w' do |io|
      io.write res.body
    end if res.is_a?(Net::HTTPSuccess)

  end

  def refresh

  end

  def stale?
    contents = File.open("../../.token", "r") { |file| file.read }
    timestamp = contents.split(",")[0];
    timestamp > Time.now.to_f
  end
end

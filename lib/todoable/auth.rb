require 'net/http'
require 'json'

class Todoable::Auth
  def initialize
    return unless Todoable::Auth.stale?
    # define request to Teachable API authentication endpoint
    url = 'http://todoable.teachable.tech/api/authenticate'
    uri = URI(url)
    req = Net::HTTP::Post.new(uri)

    # set headers for request to Teachable API
    req.basic_auth 'kamilledelgardo@gmail.com', 'todoable'
    req['Content-Type'] = "application/json"
    req['Accept'] = "application/json"

    # send credential request
    begin
    res = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(req)
    }
    rescue
      puts 'request error'
    end

    # write response to file 'authenticate'
    f = open 'authenticate', 'w'
    begin
      res_hash = JSON.parse(res.body)
    rescue
      puts 'response error'
    else
      f.write "#{res_hash['expires_at']},#{res_hash['token']}"
    ensure
      f.close unless f.nil?
    end
  end

  def self.stale?
    begin
      contents = File.read "authenticate"
      expiry = Time.parse(contents.split(',')[0])
    rescue Errno::ENOENT, NoMethodError # file nonexistent or empty
      return true
    else
      expiry < Time.now
    end
  end
end

# Auth factory for Teachable Todoable API
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

  # check auth expiry is greater than Time.now
  def self.stale?
    begin
      contents = File.read "authenticate"
      expiry = Time.parse(contents.split(',')[0])
    rescue Errno::ENOENT, NoMethodError # file nonexistent or empty
      return true
    else
      expiry < Time.now # should I add a few milliseconds in case it expires in the time btween checking and the CRUD task is being performed?
    end
  end

  # return current token for API call
  def self.curr_token
    begin
      contents = File.read "authenticate"
    rescue Errno::ENOENT, NoMethodError # file nonexistent or empty
      return "please check that file 'authorization' exists"
    else
      return contents.split(',')[1]
    end
  end
end

require "minitest/autorun"
require "todoable"
require "time"

#--------------------------------  AuthTest ------------------------------------
describe Todoable::Auth do
#   DESCRIPTION: test runner for authorization features of todoable gem
#   PARAMETERS: none
#   RETURNS: none
#-------------------------------------------------------------------------------
  before do
    @stale_timestamp = (Time.now - 1).utc.iso8601 # expired 1 second ago
    @valid_timestamp = (Time.now + 9001).utc.iso8601 # >= 20 minutes from now
    @auth_key = "ed633726-6441-4bf4-8dca-318bfd0faec1"
    @valid_auth = "#{@valid_timestamp},#{@auth_key}"
    @stale_auth = "#{@stale_timestamp},#{@auth_key}"
  end

  describe "before requesting auth token" do
    before do
      f = File.open 'authenticate', 'w'
      f.write @valid_auth
      f.close unless f.nil?
      @auth = Todoable::Auth.new
    end
    it "does not ping server if current auth is valid" do
      skip "to be tested"
    end
    it "checks staleness of current auth" do
      file_contents = File.read "authenticate"
      file_contents.must_equal @valid_auth
    end
  end

  describe "auth token requested" do
    before do
      f = File.open 'authenticate', 'w'
      f.write @stale_auth
      f.close unless f.nil?
      @auth = Todoable::Auth.new
    end
    it "refreshes stale auth" do
      file_contents = File.read "authenticate"
      file_contents.wont_equal @stale_auth
    end
    # if connection is interrupted should return message
    # should return formatted JSON
  end
end

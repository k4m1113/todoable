require "minitest/autorun"
require "todoable/list"

class ListTest < Minitest::Test

  # NEW
    # test with bad data
      # can only add name
      # sanitizes data (removing extra k/v pairs)
    # test with duplicate name
      # returns 422
    # test with good data

  # INDEX
    # should always return 200
    # returns formatted JSON

  # SHOW
    # should always return 200
      # unless bad ID given
    # returns formatted JSON

  # UPDATE
    # test with bad data
      # should raise runtime error if attempt update on non-name
    # test with valid id

  # DELETE
    # returns 204 if successful

end

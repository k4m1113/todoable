Gem::Specification.new do |s|
  s.name        = 'todoable'
  s.version     = '0.1.0'
  s.license     = 'MIT'
  s.summary     = "Todo items as a service. Just for you. We are in closed beta."
  s.description = `Assignment instructions
    Please create a gem or library that wraps the endpoints of this HTTP API. Endpoints for the API are detailed below. When you've completed the assignment, please share your GitHub repository with us. Submit your code in one of the following ways:

    Complete the assignment as a public GitHub repository.
    Complete the assignment as a private repository. Just make sure to add Iain and NoahPryor as collaborators.
    We think this should take as few as two hours if you're familiar with the type of problem, and while you could spend 10 or more hours, we don't want you to do that. If you find yourself spending too long on it, we suggest you add notes to your readme, code comments, or pending tests that explain what you would have done but didn't have time to finish.

    If you have questions about the assignment, don't hesitate to get in touch!

    Authentication
    This API uses temporary tokens that expire every 20 minutes. In short, you'll have to follow this flow:

    Contact us to get a username and password.
    Use basic auth to get a temporary token.
    Use the returned token in subsequent requests.
    Refresh the token when it expires.
    This is how to get a token:

    curl \
        -u username:password \
        -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -X POST \
        http://todoable.teachable.tech/api/authenticate
    The response body will look like this:

    {
      "token": "be08f1f4-c315-4d59-9c7c-d7a8b45a7db5"
    }
    Use this token for accessing the other endpoints:

    curl \
      -H "Authorization: Token token=\"be08f1f4-c315-4d59-9c7c-d7a8b45a7db5\""
      -H "Accept: application/json" \
      -H "Content-Type: application/json" \
      http://todoable.teachable.tech/api/lists
    From now on, this document will only list the URL, HTTP method and any JSON data you need to send. The headers are taken as a given.

    Generic
    The base URL for all requests is http://todoable.teachable.tech/api.

    Here are the most probable HTTP status codes we use:

    200 OK: The data you requested is in the body.
    201 Created: Use the Location header to find the thing you just created.
    204 No Content: Mostly used to signal that the thing has been deleted.
    401 Unauthorized: You didn't provide the right token, or it expired.
    422 Unprocessable Entity: The data you submitted are semantically incorrect. The errors are in the body.
    We might serve different status codes, based on the situation.

    Validation errors are formatted like this (there might be multiple problems per field):

    {
      "errors": {
        "name": ["missing"],
        "email": ["invalid_format"],
      }
    }
    The examples used in this document might be incomplete.

    Endpoints
    All these endpoints need a token as discussed in the authentication section.

    GET /lists
    Retrieves all lists. Response will look like:

    {
      "lists": [
        {
          "name": "Urgent Things",
          "src":  "http://todoable.teachable.tech/api/lists/:list_id"
          "id":  ":list_id"
        }, {
          "name": "Shopping List",
          "src":  "http://todoable.teachable.tech/api/lists/:list_id"
          "id":  ":list_id"
        },
      ]
    }
    POST /lists
    Creates a list.

    Submit with this data:

    {
      "list": {
        "name": "Urgent Things"
      }
    }
    Responds with status 201 when successful, or 422when there are problems.

    GET /lists/:list_id
    Retrieve the list information. This includes the todo items in this list.

    {
      "list": {
        "name": "Urgent Things"
        "items" [
          {
            "name":         "Feed the cat",
            "finished_at":  null,
            "src":          "http://todoable.teachable.tech/api/lists/:list_id/items/:item_id"
            "id":          ":item_id"
          }, {
            "name":        "Get cat food",
            "finished_at":  null,
            "src":          "http://todoable.teachable.tech/api/lists/:list_id/items/:item_id"
            "id":          ":item_id"
          },
        ]
      }
    }
    PATCH /lists/:list_id
    Updates the list. Submit the same data as when creating the list:

    {
      "list": {
        "name": "Not so urgent anymore"
      }
    }
    DELETE /lists/:list_id
    Deletes the list and all items in it.

    Responds with status 204 if successful.

    POST /lists/:list_id/items
    Creates a todo item in this list. The only field necessary is name.

    {
      "item": {
        "name": "Feed the cat"
      }
    }
    Responds with status 201 when successful, or 422when there are problems.
    PUT /lists/:list_id/items/:item_id/finish
    Mark this todo item as finished.

    Responds with status 200 if successful.

    DELETE /lists/:list_id/items/:item_id
    Deletes the item.

    Responds with status 204 if successful.

    Assignment Instructionss
    Authentication
    Generic
    Endpoints
    GET     /lists
    POST    /lists
    GET     /lists/:id
    PATCH   /lists/:id
    DELETE  /lists/:id
    POST    /lists/:id/items
    PUT     /lists/:id/items/:id/finish
    DELETE  /lists/:id/items/:id`
  s.author      = "Kamille Delgardo"
  s.email       = 'kamilledelgardo@gmail.com'
  s.files       = [
    "lib/todoable.rb",
    "lib/todoable/item.rb",
    "lib/todoable/list.rb",
    "lib/todoable/auth.rb",
    "lib/todoable/item.rb",
    "bin/todoable",
    "Rakefile",
    "test/test_auth.rb",
    "test/test_item.rb",
    "test/test_list.rb",
    "test/test_todoable.rb"
  ]
  s.executables << 'todoable'
  s.metadata    = { "source_code_uri" => "https://github.com/kamillamagna/todoable" }
end

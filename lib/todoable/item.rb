# Create, update, delete for Todoable List Item entity
class Todoable::Item
  # Todoable::Item.new
  def self.new(list_id, data)
    # data = { "item": { "name": "Play Fallout 4" } }
    Todoable::Auth.new if Todoable::Auth.stale?

    # build request object
    url = "http://todoable.teachable.tech/api/lists/#{list_id}/items"
    req = Net::HTTP::Post.new(URI(url))
    req.body = data.to_json
    Todoable.add_common_headers(req)

    res = Todoable.request(req)
    return res.code.to_i
  end

  # Todoable::item.update
  def self.update(list_id, item_id)
    # Todoable::Item.update("cd91f8fd-48bc-4bc6-8071-0f4743dbdd99", "30195ce3-ece3-4dcf-b526-cd44f6f2ceb6")
    Todoable::Auth.new if Todoable::Auth.stale?

    # build request
    url = "http://todoable.teachable.tech/api/lists/#{list_id}/items/#{item_id}/finish"
    req = Net::HTTP::Put.new(URI(url))
    data = { finished_at: Time.now }
    req.body = data.to_json
    Todoable.add_common_headers(req)

    # make request
    res = Todoable.request(req)
    return res.code.to_i
  end

  # Todoable::Item.delete
  def self.delete(list_id, item_id)
    Todoable::Auth.new if Todoable::Auth.stale?

    # build up request object
    url = "http://todoable.teachable.tech/api/lists/#{list_id}/items/#{item_id}"
    req = Net::HTTP::Delete.new(URI(url))
    Todoable.add_common_headers(req)

    #make request
    res = Todoable.request(req)
    return res.code.to_i
  end
end

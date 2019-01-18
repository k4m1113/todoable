# CRUD for Todoable List entity
class Todoable::List
  # Todoable::List.index
  def self.index
    Todoable::Auth.new if Todoable::Auth.stale?

    # build request
    url = "http://todoable.teachable.tech/api/lists"
    req = Net::HTTP::Get.new(URI(url))
    Todoable.add_common_headers(req)

    # make request
    res = Todoable.request(req)
    return JSON.parse(res.body)
  end

  # Todoable::List.new
  def self.new(data)
    # Todoable::List.new( { "list": { "name": "Kamille's New Things" } })
    name = data[:list][:name]
    raise 'bad data -- may only add list name' if name.nil?
    sani_data = { list: { name: name } }

    Todoable::Auth.new if Todoable::Auth.stale?

    # build request
    url = "http://todoable.teachable.tech/api/lists"
    req = Net::HTTP::Post.new(URI(url))
    req.body = sani_data.to_json
    Todoable.add_common_headers(req)

    # make request
    res = Todoable.request(req)
    return res.code.to_i
  end

  # Todoable::List.update
  def self.update(id, data)
    raise 'ID must be in format "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"' if id.length != 36

    # sanitize data
    name = data[:list][:name]
    raise 'bad data -- may only update list name' if name.nil?
    sani_data = { list: { name: name } }

    Todoable::Auth.new if Todoable::Auth.stale?

    # build request
    url = "http://todoable.teachable.tech/api/lists/#{id}"
    req = Net::HTTP::Patch.new(URI(url))

    req.body = sani_data.to_json
    Todoable.add_common_headers(req)

    res = Todoable.request(req)
    return res.code.to_i
  end

  # Todoable::List.show
  def self.show(id)
    raise 'ID must be in format "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"' if id.length != 36

    Todoable::Auth.new if Todoable::Auth.stale?

    # build request
    url = "http://todoable.teachable.tech/api/lists/#{id}"
    req = Net::HTTP::Get.new(URI(url))
    Todoable.add_common_headers(req)

    # make request
    res = Todoable.request(req)
    return JSON.parse(res.body)
  end

  # Todoable::List.delete
  def self.delete(id)
    Todoable::Auth.new if Todoable::Auth.stale?
    # build request
    url = "http://todoable.teachable.tech/api/lists/#{id}"
    req = Net::HTTP::Delete.new(URI(url))
    Todoable.add_common_headers(req)

    # make request
    res = Todoable.request(req)
    return res.code.to_i
  end
end

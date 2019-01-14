Gem::Specification.new do |s|
  s.name        = 'todoable'
  s.version     = '0.1.0'
  s.license     = 'MIT'
  s.summary     = "Todo list creator and editor"
  s.description = "Todo items as a service. Just for you. We are in closed beta."
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

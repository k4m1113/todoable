class Todoable::Auth
  def initialize
    
  end

  def refresh

  end

  def stale?
    contents = File.open("../../.token", "r") { |file| file.read }
    timestamp = contents.split(",")[0];
    timestamp > Time.now.to_f
  end
end

module Findable::Findable
  def find_by_name(name)
    all.detect {|n| n.name == name}
  end
end

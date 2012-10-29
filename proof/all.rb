require_relative "../lib/settings"

class Source
  include Settings

  def param1
    "one"
  end

  def param2
    "two"
  end
end

s = Source.new

class Destination
  include Settings

  setting :param2
end

d = Destination.new

class Dtwo
  include Settings

  setting :param1
end

class Dthree
  include Settings

  # no settings
end

d2 = Dtwo.new
d3 = Dthree.new

# Settings.set(s,d)
# Settings.set(s,d2)
# Settings.set(s,d3)

s.set d
s.set d2, :param1
s.set d3

puts d.param2
puts d2.param1
puts "#{d3} didn't break"
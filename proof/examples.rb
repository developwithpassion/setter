class Destination
  include Settings

  setting :some_setting
  setting :other_setting
end

class Source
  include Settings

  attr_accessor :some_setting
end

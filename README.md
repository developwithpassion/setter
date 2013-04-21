# Setter

The `setter` library enables specification of and assignment to a class's "settings".

## Status

**Unreleased**

NOTE: Dependencies are linked locally in the development environment via the [`path_gem` library](https://github.com/Sans/path-gem). Dependencies aren't installed by RubyGems, and some dependencies aren't yet published.

## Installation

Install the gem itself.

    [PROJECTS]$ git clone ssh://git@$REPOSITORY_PATH/setter.git
    [PROJECTS]$ cd setter
    [PROJECTS/setter]$ gem install bundler
    [PROJECTS/setter]$ gem install path_gem
    [PROJECTS/setter]$ bundle

Make the gem available for `path-gem`.

    cd $PATH_GEM_DIR
    [PATH_GEM_DIR]$ ln -s $PROJECTS/setter setter

## Usage

### Include Setter::Settings

Including `Setter::Settings` allows specification of a `setting`.

```ruby
class Something
  def some_method
  end
end

class Receiver
  include Setter::Settings

  setting :some_setting
  setting :other_setting
  setting :with_default, :default => 13 # settings can have defaults
  # a default can also be an object, that responds to every method with nil
  setting :with_null, :default => null_object(Something)
end

r = Receiver.new

r.some_setting = "some value"
r.some_setting == "some value" # true
r.with_default == 13 # true
r.with_default = 15
r.with_default == 15 # true
r.with_null.some_method == nil # true

class Other
  def some_method
    'hi'
  end
end

r.with_null = Other.new
r.with_null.some_method == 'hi' # true

```

### Include Setter

Inclusion of `Setter` allows setting settings from the senders attributes to the settings of the receiver.

```ruby
class Sender
  include Setter

  attr_accessor :some_setting
  attr_accessor :other_setting
end

s = Sender.new
s.some_setting = "value"
s.other_setting = "other value"

r = Receiver.new

# Set specific setting
s.set r, :some_setting
r.some_setting == "value" # true
r.other_setting == nil # true

# Set all settings
s.set r
r.some_setting == "value" # true
r.other_setting == "other value" # true
```

## License

Setter is released under the [MIT License](http://www.opensource.org/licenses/MIT).

Bu
==

Bu is just a gem that implements a simple observer pattern.

Usage
-----

```ruby
  class AwesomeSubscriber
    def self.subscribed_to
      [:awesome_event, :another_awesome_event]
    end

    def self.event(type, additional_data)
      # do something cool.
    end
  end

  Bu::Publisher.subscribe(AwesomeSubscriber)

  Bu::Publisher.publish(:awesome_event, message: "yay!")
```

require "set"

module Bu
  class Publisher
    def self.subscribe(subscriber)
      subscriber.subscribed_to.each { |subscribed_topic| topic(subscribed_topic) << subscriber }
    end

    def self.topic(topic)
      subscribers[topic.to_sym] ||= Set.new
    end

    def self.publish(event_type, info = {})
      subscribed_to_topic = subscribers[event_type] || []
      subscribed_to_topic.each { |subscriber| subscriber.event(event_type, info) }
    end

    def self.unsubscribe_all
      @@subscribers = {}
    end

    private

    def self.subscribers
      @@subscribers ||= {}
    end

    private_class_method :subscribers
  end
end

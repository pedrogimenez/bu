require "bu/publisher"

describe Bu::Publisher do
  after do
    Bu::Publisher.unsubscribe_all
  end

  it "publishes events to the registered subscribers" do
    subscriber = double(:subscriber)
    expect(subscriber).to receive(:subscribed_to).and_return([:some_event])
    expect(subscriber).to receive(:event).with(:some_event, message: "sup")

    another_subscriber = double(:subscriber)
    expect(another_subscriber).to receive(:subscribed_to).and_return([:some_event])
    expect(another_subscriber).to receive(:event).with(:some_event, message: "sup")

    Bu::Publisher.subscribe(subscriber)
    Bu::Publisher.subscribe(another_subscriber)

    Bu::Publisher.publish(:some_event, message: "sup")
  end

  it "doesn't publish events that don't are of interest to a subscriber" do
    subscriber = double(:subscriber)
    expect(subscriber).to receive(:subscribed_to).and_return([:some_event])
    expect(subscriber).to_not receive(:event)

    another_subscriber = double(:subscriber)
    expect(another_subscriber).to receive(:subscribed_to).and_return([:another_event])
    expect(another_subscriber).to receive(:event).with(:another_event, {})

    Bu::Publisher.subscribe(subscriber)
    Bu::Publisher.subscribe(another_subscriber)

    Bu::Publisher.publish(:another_event)
  end
end

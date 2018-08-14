require "oystercard"

describe Oystercard do
#  let(:subject) { Oystercard.new }
  # Code below was first test written and is superceded by subsequent #balance tests
  # it "it responds to #balance" do
  #   expect(subject).to respond_to(:balance)
  # end

  it "has initial balance of 0" do
    expect(subject.balance).to eq(0)
  end

  describe "#top_up" do

    # it "responds to #top_up" do
    #   expect(subject).to respond_to(:top_up).with(1).argument
    # end

    it "adds amount to #balance" do
      card = Oystercard.new
      amount = 20
      card.top_up(amount)
      expect(card.balance).to eq(amount)
    end

    it "raises an error if the maximum balance is exceeded" do
      maximum_balance = Oystercard::CARD_LIMIT
      subject.top_up(maximum_balance)
      expect{ subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end
  end

  # Code above on walkthrough and replaces code below:
  # it "raises an error - attempt to raise card balance over £90" do
  #   card = Oystercard.new
  #   #card.top_up(100)
  #   expect { card.top_up(91) }.to raise_error "Invalid request - Balance will exceed £#{Oystercard::CARD_LIMIT}"
  # end

  # it "responds to #deduct" do
  #   expect(subject).to respond_to(:deduct)
  # end

  # it "responds to #touch_in" do
  #   expect(subject).to respond_to(:touch_in)
  # end

  describe "#touch_in" do

    it "Raised error is balance below minimum fare" do
      expect { subject.touch_in }.to raise_error("Insufficient funds, balance below #{Oystercard::MINIMUM_FARE}")
    end

    context "topped up with 10 and then touched in" do

      before(:each) do
        subject.top_up(10)
        subject.touch_in
      end

      it "Sets station_id to the entry station" do
        expect(subject.entry_station).to eq(:xx)
      end

      it "sets :in_journey to true" do
        expect(subject.in_journey).to eq(true)
      end
    end
  end

  describe "#touch_out" do

    it "deducts minimum fare from the card balance" do
      subject.top_up(10)
      subject.touch_in
      expect { subject.touch_out }.to change{ subject.balance }.by(-Oystercard::MINIMUM_FARE)
    end

    context "topped up with 10, touched in and touched out" do

      before(:each) do
        subject.top_up(10)
        subject.touch_in
        subject.touch_out
      end

      it "Sets station_id to exit station" do
        expect(subject.exit_station).to eq(:xx)
      end

      it "sets :in_journey to false" do
        expect(subject.in_journey).to eq(false)
      end
    end
  end

  describe "#in_journey?" do

    # it "responds to #in_journey?" do
    #   expect(subject).to respond_to(:in_journey?)
    # end

    it "in_journey defaults to false" do
      subject.in_journey?
      expect(subject.in_journey).to eq(false)
    end

    it "in_journey defaults to false" do
      subject.in_journey?(true)
      expect(subject.in_journey).to eq(true)
    end
  end

# experimental rspec code
  # it "expect card to be an instance of Oystercard" do
  #   card = Oystercard.new
  #   expect(card).to be_an_instance_of(Oystercard)
  # end


end

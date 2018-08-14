require "oystercard"

describe Oystercard do
#  let(:subject) { Oystercard.new }
  # it "it responds to #balance" do
  #   expect(subject).to respond_to(:balance)
  # end

  it "has initial balance of 0" do
    expect(subject.balance).to eq(0)
  end

  it "responds to #top_up" do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

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
  # Code above on walkthrough and replaces code below:
  # it "raises an error - attempt to raise card balance over £90" do
  #   card = Oystercard.new
  #   #card.top_up(100)
  #   expect { card.top_up(91) }.to raise_error "Invalid request - Balance will exceed £#{Oystercard::CARD_LIMIT}"
  # end



# experimental rspec code
  # it "expect card to be an instance of Oystercard" do
  #   card = Oystercard.new
  #   expect(card).to be_an_instance_of(Oystercard)
  # end


end

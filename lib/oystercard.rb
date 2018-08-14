class Oystercard
  CARD_LIMIT = 90
  attr_accessor :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    # line below is in walkthrough and replaces the subsequent 2 lines
    fail "Maximum balance of #{CARD_LIMIT} exceeded" if amount + balance > CARD_LIMIT
    # value = balance + amount
    # raise "Invalid request - Balance will exceed £#{CARD_LIMIT}" if value > 90
    self.balance += amount
  end

end

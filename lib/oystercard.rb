class Oystercard
  CARD_LIMIT = 90
  MINIMUM_BALANCE = 1
  attr_accessor :balance, :entry_station, :exit_station, :in_journey

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

  def deduct
  end

  def touch_in(station_id=:xx)
    fail "Insufficient funds, balance below #{Oystercard::MINIMUM_BALANCE}" if balance < MINIMUM_BALANCE
    @entry_station = station_id
    in_journey?(true)
  end

  def touch_out(station_id=:xx)
    @exit_station = station_id
    in_journey?
  end

  def in_journey?(state=false)
    @in_journey = state
  end

end

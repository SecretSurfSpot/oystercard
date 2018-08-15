class Oystercard
  CARD_LIMIT = 90
  MINIMUM_FARE = 1
  attr_accessor :balance, :entry_station, :exit_station

  def initialize
    @balance = 0
    @journey_array =[]
  end

  def top_up(amount)
    # line below is in walkthrough and replaces the subsequent 2 lines
    fail "Maximum balance of #{CARD_LIMIT} exceeded" if amount + balance > CARD_LIMIT
    # value = balance + amount
    # raise "Invalid request - Balance will exceed £#{CARD_LIMIT}" if value > 90
    self.balance += amount
  end

  def touch_in(station_id=:xx)
    fail "Insufficient funds, balance below #{Oystercard::MINIMUM_FARE}" if balance < MINIMUM_FARE
    @entry_station = station_id
  end

  def touch_out(station_id=:xx)
    @exit_station = station_id
    add_journey
    @entry_station = nil
    deduct
  end

  def in_journey?
    !!@entry_station
  end

  def add_journey
    @journey_array << { entry: @entry_station, exit: @exit_station }
  end

  def journey_history
    str = ""
    @journey_array.each do |element|
      str += "Entry: #{element[:entry]}, Exit: #{element[:exit]}\n"
    end
    puts str
  end

  private
  def deduct
    @balance -= MINIMUM_FARE
  end

end

require_relative "oystercard"

oc = Oystercard.new
oc.top_up(20)
oc.touch_in("Aldgate")
p oc.entry_station
p oc.balance
oc.touch_out("Blackfriars")
p oc.exit_station
p oc.balance

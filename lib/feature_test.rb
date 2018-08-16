require_relative "oystercard"

oc = Oystercard.new
oc.top_up(20)
oc.touch_in("Aldgate")
oc.touch_out("Blackfriars")
oc.touch_in("Clapham")
oc.touch_out("Brixton")
oc.touch_in("Whitechapel")
oc.touch_out("Tower Bridge")
p oc.journey_history
st = Station.new

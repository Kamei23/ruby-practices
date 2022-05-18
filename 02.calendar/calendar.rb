require "date"
require "optparse"

today = Date.today
options = ARGV.getopts("y:", "m:")
year  = (options["y"] || today.year).to_i
month = (options["m"] || today.month).to_i
first_date = Date.new(year, month, 1)
last_date = Date.new(year, month, -1)
first_wday = first_date.wday
dates = (first_date..last_date)
calender_head = first_date.strftime("%-m月 %Y")
day_of_the_week = "日 月 火 水 木 金 土"

puts calender_head.center(20)
puts day_of_the_week
print "   " * first_wday

dates.each do |date|
  formatted_day = date.day.to_s.rjust(2)
  if date.saturday?
    print formatted_day + "\n"
  else
    print formatted_day + " "
  end
end

#!/usr/bin/env ruby

require 'optparse'
require 'date'

#オプション
params = ARGV.getopts("y:m:")

if params["y"] == nil
    year = Date.today.year
else
    year = params["y"].to_i
end
if params["m"] == nil
    month =Date.today.month
else
    month = params["m"].to_i
end

#必要なデータ
last_day = Date.new(year, month, -1).day
first_wday = Date.new(year, month, 1).wday

#○年○月
puts "#{month}月 #{year}".center(20)
#曜日
puts "日 月 火 水 木 金 土"
#日にち　＊最初のスペース、土曜に改行
print "   " * first_wday

wday = first_wday
(1..last_day).each do |date|
    print sprintf("%2d", date) + " "
    wday = wday + 1
    if wday % 7 ==0
        print "\n"
    end
end
if wday % 7 != 0
    print "\n"
end
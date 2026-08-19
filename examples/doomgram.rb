#! /usr/bin/env ruby

# examples/doomgram.rb


require 'diagnosticism/doomgram'


include Diagnosticism


dg = DOOMGram.new

dg.push_event_time_ns   9
dg.push_event_time_ns  80
dg.push_event_time_ns 700
dg.push_event_time_us   6
dg.push_event_time_us  50
dg.push_event_time_us 400
dg.push_event_time_ms   3
dg.push_event_time_ms  20
dg.push_event_time_ms 100
dg.push_event_time_s    9
dg.push_event_time_s   80
dg.push_event_time_s  700

puts "event_count=#{dg.event_count}"
puts "min_ns=#{dg.min_event_time_ns} max_ns=#{dg.max_event_time_ns}"
puts "to_s=#{dg}"
puts "to_strip(zero='-', range='abcd')=#{dg.to_strip(zero_character: '-', range: 'abcd')}"

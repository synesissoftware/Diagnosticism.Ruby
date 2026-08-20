# Diagnosticism.Ruby - Example - **doomgram**

## Summary

Simple example illustrating use of the ``DOOMGram`` class: push timings in
nanoseconds, microseconds, milliseconds, and seconds, then print the
12-character magnitude strip.

## Source

```ruby

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
```

Twelve sample events are pushed, one into each order-of-magnitude bucket
from 1ns through 100s+. ``to_s`` / ``to_strip`` then render a 12-character
strip whose letters encode the decimal order of the count in each bucket
(``a`` means 1–9 events). A second strip uses a shorter range and a custom
zero character.

## Usage

When run (with ``lib`` on the load path, or after ``gem install diagnosticism``), this produces the following output:

```
event_count=12
min_ns=9 max_ns=700000000000
to_s=aaaaaaaaaaaa
to_strip(zero='-', range='abcd')=aaaaaaaaaaaa
```


<!-- ########################### end of file ########################### -->

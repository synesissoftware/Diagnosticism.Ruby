#! /usr/bin/env ruby

$:.unshift File.join(File.dirname(__FILE__), '../..', 'lib')

require 'diagnosticism/doomgram'

require 'xqsr3/extensions/test/unit'
require 'test/unit'


class Test_DoomGram < Test::Unit::TestCase

  include ::Diagnosticism

  def test_empty

    dg = DOOMGram.new

    dg.freeze

    assert_equal 0, dg.event_count

    assert_equal 0, dg.total_event_time_ns
    assert_nil dg.min_event_time_ns
    assert_nil dg.max_event_time_ns

    assert_equal 0, dg.num_events_in_1ns
    assert_equal 0, dg.num_events_in_10ns
    assert_equal 0, dg.num_events_in_100ns
    assert_equal 0, dg.num_events_in_1us
    assert_equal 0, dg.num_events_in_10us
    assert_equal 0, dg.num_events_in_100us
    assert_equal 0, dg.num_events_in_1ms
    assert_equal 0, dg.num_events_in_10ms
    assert_equal 0, dg.num_events_in_100ms
    assert_equal 0, dg.num_events_in_1s
    assert_equal 0, dg.num_events_in_10s
    assert_equal 0, dg.num_events_ge_100s

    assert_equal "____________", dg.to_s
    assert_equal "____________", dg.to_strip
  end

  def test_single_timing_event

    dg = DOOMGram.new

    dg.push_event_time_ms 13

    assert_equal 1, dg.event_count

    assert_equal 13000000, dg.total_event_time_ns
    assert_equal 13000000, dg.min_event_time_ns
    assert_equal 13000000, dg.max_event_time_ns

    assert_equal 0, dg.num_events_in_1ns
    assert_equal 0, dg.num_events_in_10ns
    assert_equal 0, dg.num_events_in_100ns
    assert_equal 0, dg.num_events_in_1us
    assert_equal 0, dg.num_events_in_10us
    assert_equal 0, dg.num_events_in_100us
    assert_equal 0, dg.num_events_in_1ms
    assert_equal 1, dg.num_events_in_10ms
    assert_equal 0, dg.num_events_in_100ms
    assert_equal 0, dg.num_events_in_1s
    assert_equal 0, dg.num_events_in_10s
    assert_equal 0, dg.num_events_ge_100s

    assert_equal "_______a____", dg.to_s
    assert_equal "_______a____", dg.to_strip
  end

  def test_zero_time_events

    dg = DOOMGram.new

    dg.push_event_time_ns 0
    dg.push_event_time_us 0
    dg.push_event_time_ms 0
    dg.push_event_time_s 0

    assert_equal 4, dg.event_count

    assert_equal 0, dg.total_event_time_ns
    assert_equal 0, dg.min_event_time_ns
    assert_equal 0, dg.max_event_time_ns

    assert_equal 0, dg.num_events_in_1ns
    assert_equal 0, dg.num_events_in_10ns
    assert_equal 0, dg.num_events_in_100ns
    assert_equal 0, dg.num_events_in_1us
    assert_equal 0, dg.num_events_in_10us
    assert_equal 0, dg.num_events_in_100us
    assert_equal 0, dg.num_events_in_1ms
    assert_equal 0, dg.num_events_in_10ms
    assert_equal 0, dg.num_events_in_100ms
    assert_equal 0, dg.num_events_in_1s
    assert_equal 0, dg.num_events_in_10s
    assert_equal 0, dg.num_events_ge_100s

    assert_equal "____________", dg.to_s
    assert_equal "____________", dg.to_strip
  end

  def test_uniform_spread_timings_1

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


    assert_equal 12, dg.event_count

    assert_equal 789123456789, dg.total_event_time_ns
    assert_equal 9, dg.min_event_time_ns
    assert_equal 700_000_000_000, dg.max_event_time_ns

    assert_equal 1, dg.num_events_in_1ns
    assert_equal 1, dg.num_events_in_10ns
    assert_equal 1, dg.num_events_in_100ns
    assert_equal 1, dg.num_events_in_1us
    assert_equal 1, dg.num_events_in_10us
    assert_equal 1, dg.num_events_in_100us
    assert_equal 1, dg.num_events_in_1ms
    assert_equal 1, dg.num_events_in_10ms
    assert_equal 1, dg.num_events_in_100ms
    assert_equal 1, dg.num_events_in_1s
    assert_equal 1, dg.num_events_in_10s
    assert_equal 1, dg.num_events_ge_100s

    assert_equal "aaaaaaaaaaaa", dg.to_s
    assert_equal "aaaaaaaaaaaa", dg.to_strip
  end

  def test_uniform_spread_timings_2

    dg = DOOMGram.new

    dg.push_event_time_ns      9
    dg.push_event_time_ns     80
    dg.push_event_time_ns    700
    dg.push_event_time_ns   6000
    dg.push_event_time_ns  50000
    dg.push_event_time_ns 400000
    dg.push_event_time_ms      3
    dg.push_event_time_ms     20
    dg.push_event_time_ms    100
    dg.push_event_time_ms   9000
    dg.push_event_time_ms  80000
    dg.push_event_time_ms 700000

    assert_equal 12, dg.event_count

    assert_equal 789123456789, dg.total_event_time_ns
    assert_equal 9, dg.min_event_time_ns
    assert_equal 700_000_000_000, dg.max_event_time_ns

    assert_equal 1, dg.num_events_in_1ns
    assert_equal 1, dg.num_events_in_10ns
    assert_equal 1, dg.num_events_in_100ns
    assert_equal 1, dg.num_events_in_1us
    assert_equal 1, dg.num_events_in_10us
    assert_equal 1, dg.num_events_in_100us
    assert_equal 1, dg.num_events_in_1ms
    assert_equal 1, dg.num_events_in_10ms
    assert_equal 1, dg.num_events_in_100ms
    assert_equal 1, dg.num_events_in_1s
    assert_equal 1, dg.num_events_in_10s
    assert_equal 1, dg.num_events_ge_100s

    assert_equal "aaaaaaaaaaaa", dg.to_s
    assert_equal "aaaaaaaaaaaa", dg.to_strip
  end

  def test_uniform_spread_timings_3

    dg = DOOMGram.new

    dg.push_event_time_ns            9
    dg.push_event_time_ns           80
    dg.push_event_time_ns          700
    dg.push_event_time_ns         6000
    dg.push_event_time_ns        50000
    dg.push_event_time_ns       400000
    dg.push_event_time_ns      3000000
    dg.push_event_time_ns     20000000
    dg.push_event_time_ns    100000000
    dg.push_event_time_ns   9000000000
    dg.push_event_time_ns  80000000000
    dg.push_event_time_ns 700000000000

    assert_equal 12, dg.event_count

    assert_equal 789123456789, dg.total_event_time_ns
    assert_equal 9, dg.min_event_time_ns
    assert_equal 700_000_000_000, dg.max_event_time_ns

    assert_equal 1, dg.num_events_in_1ns
    assert_equal 1, dg.num_events_in_10ns
    assert_equal 1, dg.num_events_in_100ns
    assert_equal 1, dg.num_events_in_1us
    assert_equal 1, dg.num_events_in_10us
    assert_equal 1, dg.num_events_in_100us
    assert_equal 1, dg.num_events_in_1ms
    assert_equal 1, dg.num_events_in_10ms
    assert_equal 1, dg.num_events_in_100ms
    assert_equal 1, dg.num_events_in_1s
    assert_equal 1, dg.num_events_in_10s
    assert_equal 1, dg.num_events_ge_100s

    assert_equal "aaaaaaaaaaaa", dg.to_s
    assert_equal "aaaaaaaaaaaa", dg.to_strip
  end

  def test_uniform_spread_timings_4

    dg = DOOMGram.new

    dg.push_event_time_us         6
    dg.push_event_time_us        50
    dg.push_event_time_us       400
    dg.push_event_time_us      3000
    dg.push_event_time_us     20000
    dg.push_event_time_us    100000
    dg.push_event_time_us   9000000
    dg.push_event_time_us  80000000
    dg.push_event_time_us 700000000

    assert_equal 9, dg.event_count

    assert_equal 789123456000, dg.total_event_time_ns
    assert_equal 6_000, dg.min_event_time_ns
    assert_equal 700_000_000_000, dg.max_event_time_ns

    assert_equal 0, dg.num_events_in_1ns
    assert_equal 0, dg.num_events_in_10ns
    assert_equal 0, dg.num_events_in_100ns
    assert_equal 1, dg.num_events_in_1us
    assert_equal 1, dg.num_events_in_10us
    assert_equal 1, dg.num_events_in_100us
    assert_equal 1, dg.num_events_in_1ms
    assert_equal 1, dg.num_events_in_10ms
    assert_equal 1, dg.num_events_in_100ms
    assert_equal 1, dg.num_events_in_1s
    assert_equal 1, dg.num_events_in_10s
    assert_equal 1, dg.num_events_ge_100s

    assert_equal "___aaaaaaaaa", dg.to_s
    assert_equal "___aaaaaaaaa", dg.to_strip
  end

  def test_several_distinct_timings

    dg = DOOMGram.new

    dg.push_event_time_ns  23
    dg.push_event_time_ns  10
    dg.push_event_time_us   7
    dg.push_event_time_us   7
    dg.push_event_time_us  89
    dg.push_event_time_ms 248
    dg.push_event_time_s    5
    dg.push_event_time_s  309

    assert_equal 8, dg.event_count

    assert_equal 314248103033, dg.total_event_time_ns
    assert_equal 10, dg.min_event_time_ns
    assert_equal 309_000_000_000, dg.max_event_time_ns

    assert_equal 0, dg.num_events_in_1ns
    assert_equal 2, dg.num_events_in_10ns
    assert_equal 0, dg.num_events_in_100ns
    assert_equal 2, dg.num_events_in_1us
    assert_equal 1, dg.num_events_in_10us
    assert_equal 0, dg.num_events_in_100us
    assert_equal 0, dg.num_events_in_1ms
    assert_equal 0, dg.num_events_in_10ms
    assert_equal 1, dg.num_events_in_100ms
    assert_equal 1, dg.num_events_in_1s
    assert_equal 0, dg.num_events_in_10s
    assert_equal 1, dg.num_events_ge_100s

    assert_equal "_a_aa___aa_a", dg.to_s
    assert_equal "_a_aa___aa_a", dg.to_strip
  end

  def test_several_intersecting_timings

    dg = DOOMGram.new

    dg.push_event_time_ns    11
    dg.push_event_time_ns    19
    dg.push_event_time_ns    19
    dg.push_event_time_us     7
    dg.push_event_time_us     7
    dg.push_event_time_us    89
    dg.push_event_time_ms   248
    dg.push_event_time_ms 4_321
    dg.push_event_time_s      5
    dg.push_event_time_s    309

    assert_equal 10, dg.event_count

    assert_equal 318569103049, dg.total_event_time_ns
    assert_equal 11, dg.min_event_time_ns
    assert_equal 309_000_000_000, dg.max_event_time_ns

    assert_equal 0, dg.num_events_in_1ns
    assert_equal 3, dg.num_events_in_10ns
    assert_equal 0, dg.num_events_in_100ns
    assert_equal 2, dg.num_events_in_1us
    assert_equal 1, dg.num_events_in_10us
    assert_equal 0, dg.num_events_in_100us
    assert_equal 0, dg.num_events_in_1ms
    assert_equal 0, dg.num_events_in_10ms
    assert_equal 1, dg.num_events_in_100ms
    assert_equal 2, dg.num_events_in_1s
    assert_equal 0, dg.num_events_in_10s
    assert_equal 1, dg.num_events_ge_100s

    assert_equal "_a_aa___aa_a", dg.to_s
    assert_equal "_a_aa___aa_a", dg.to_strip
  end

  def test_many_cumulative_timings

    dg = DOOMGram.new

    (0...10000).each { dg.push_event_time_ns 1 }

    (0...1000).each { dg.push_event_time_us 1 }

    (0...100).each { dg.push_event_time_ms 1 }

    (0...10).each { dg.push_event_time_s 1 }

    assert_equal 11110, dg.event_count

    assert_equal 10101010000, dg.total_event_time_ns
    assert_equal 1, dg.min_event_time_ns
    assert_equal 1_000_000_000, dg.max_event_time_ns

    assert_equal 10_000, dg.num_events_in_1ns
    assert_equal 0, dg.num_events_in_10ns
    assert_equal 0, dg.num_events_in_100ns
    assert_equal 1_000, dg.num_events_in_1us
    assert_equal 0, dg.num_events_in_10us
    assert_equal 0, dg.num_events_in_100us
    assert_equal 100, dg.num_events_in_1ms
    assert_equal 0, dg.num_events_in_10ms
    assert_equal 0, dg.num_events_in_100ms
    assert_equal 10, dg.num_events_in_1s
    assert_equal 0, dg.num_events_in_10s
    assert_equal 0, dg.num_events_ge_100s

    assert_equal "e__d__c__b__", dg.to_s
    assert_equal "e__d__c__b__", dg.to_strip
    assert_equal "*--d--c--b--", dg.to_strip(range: 'abcd', zero_character: '-')
    assert_equal "#  #  c  b  ", dg.to_strip(range: 'abc', zero_character: ' ', overflow_character: '#')
  end
end


# ############################## end of file ############################# #


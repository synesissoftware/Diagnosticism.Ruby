# ######################################################################## #
# File:     doomgram.rb
#
# Purpose:  Definition of the `DOOMGram` class.
#
# Created:  9th January 2025
# Updated:  9th January 2025
#
# Author:   Matthew Wilson
#
# Copyright (c) 2025, Matthew Wilson and Synesis Information Systems
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright notice,
#   this list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# ######################################################################## #


=begin
=end

module Diagnosticism

# Decimal Order-Of-Magnitude frequency histoGRAM
class DOOMGram

  def initialize

    @event_count          = 0

    @total_event_time_ns  = 0

    @min_event_time_ns    = nil
    @max_event_time_ns    = nil

    @num_events_in_1ns    = 0
    @num_events_in_10ns   = 0
    @num_events_in_100ns  = 0
    @num_events_in_1us    = 0
    @num_events_in_10us   = 0
    @num_events_in_100us  = 0
    @num_events_in_1ms    = 0
    @num_events_in_10ms   = 0
    @num_events_in_100ms  = 0
    @num_events_in_1s     = 0
    @num_events_in_10s    = 0
    @num_events_ge_100s   = 0
  end # initialize()

  # Number of events counted
  attr_reader :event_count
  # Obtains the total event time (in nanoseconds)
  attr_reader :total_event_time_ns
  # Obtain the minimum event time (in nanoseconds), or +nil+ if no events
  attr_reader :min_event_time_ns
  # Obtain the maximum event time (in nanoseconds), or +nil+ if no events
  attr_reader :max_event_time_ns
  # Number of events counted in the interval [1ns, 10ns)
  attr_reader :num_events_in_1ns
  # Number of events counted in the interval [10ns, 100ns)
  attr_reader :num_events_in_10ns
  # Number of events counted in the interval [100ns, 1µs)
  attr_reader :num_events_in_100ns
  # Number of events counted in the interval [1µs, 10µs)
  attr_reader :num_events_in_1us
  # Number of events counted in the interval [10µs, 100µs)
  attr_reader :num_events_in_10us
  # Number of events counted in the interval [100µs, 1ms)
  attr_reader :num_events_in_100us
  # Number of events counted in the interval [1ms, 10ms)
  attr_reader :num_events_in_1ms
  # Number of events counted in the interval [10ms, 100ms)
  attr_reader :num_events_in_10ms
  # Number of events counted in the interval [100ms, 1s)
  attr_reader :num_events_in_100ms
  # Number of events counted in the interval [1s, 10s)
  attr_reader :num_events_in_1s
  # Number of events counted in the interval [10s, 100s)
  attr_reader :num_events_in_10s
  # Number of events counted in the interval [100s, ∞)
  attr_reader :num_events_ge_100s

  # Pushes an event with the given number of nanoseconds
  def push_event_time_ns(time_in_ns)

    @event_count += 1

    @total_event_time_ns += time_in_ns


    if @min_event_time_ns.nil? || time_in_ns < @min_event_time_ns

      @min_event_time_ns = time_in_ns
    end

    if @max_event_time_ns.nil? || @max_event_time_ns < time_in_ns

      @max_event_time_ns = time_in_ns
    end


    if time_in_ns >= 100_000_000

      if time_in_ns >= 10_000_000_000

        if time_in_ns >= 100_000_000_000

          @num_events_ge_100s += 1
        else

          @num_events_in_10s += 1
        end
      else

        if time_in_ns >= 1_000_000_000

          @num_events_in_1s += 1
        else

          @num_events_in_100ms += 1
        end
      end
    else

      if time_in_ns >= 10_000

        if time_in_ns >= 1_000_000

          if time_in_ns >= 10_000_000

            @num_events_in_10ms += 1
          else

            @num_events_in_1ms += 1
          end
        else

          if time_in_ns >= 100_000

            @num_events_in_100us += 1
          else

            @num_events_in_10us += 1
          end
        end
      else

        if time_in_ns >= 100

          if time_in_ns >= 1_000

            @num_events_in_1us += 1
          else

            @num_events_in_100ns += 1
          end
        else

          if time_in_ns >= 10

            @num_events_in_10ns += 1
          elsif time_in_ns >= 1

            @num_events_in_1ns += 1
          end
        end
      end
    end
  end

  # Pushes an event with the given number of microseconds
  def push_event_time_us(time_in_us)

    push_event_time_ns time_in_us * 1_000
  end

  # Pushes an event with the given number of milliseconds
  def push_event_time_ms(time_in_ms)

    push_event_time_ns time_in_ms * 1_000_000
  end

  # Pushes an event with the given number of seconds
  def push_event_time_s(time_in_s)

    push_event_time_ns time_in_s * 1_000_000_000
  end

  # Converts to string form according to given options
  #
  # === Signature
  #
  # * *Parameters:*
  #   - +options+ (+Hash+, +Integer+) Combination of flags (with behaviour as described below for the +flags+ option), or an options hash;
  #
  # * *Options:*
  #   - +overflow_character+ (+String+) A string (of length 1) that specifies the symbol for counts outside the available range. Defaults to +'*'+;
  #   - +range+ (+String+) A string whose characters specificy the symbols to use for counts in orders of magnitude. Defaults to +'abcdefghijklmnopqrstuvwxyz'+, which caters to the counts 1-9 => +'a', 10-99 => +'b'+, 100-999 => +'c'+, ... 10^25-(10^26-1) => +'z'+;
  #   - +zero_character+ (+String+) A string (of length 1) that specifies the symbol for a count of 0. Defaults to +' '+;
  #
  # === Return
  # (+String+) A string (of length 12) containing symbols representing the counts in the ranges 1ns, 10ns, ..., 10s, 100+s.
  def to_strip **options

    ch_zero     = options[:zero_character] || options[:zero_char] || '_'
    ch_overflow = options[:overflow_character] || options[:overflow_char] || '*'
    range_chars = options[:range] || 'abcdefghijklmnopqrstuvwxyz'

    counts = [
      num_events_in_1ns,
      num_events_in_10ns,
      num_events_in_100ns,
      num_events_in_1us,
      num_events_in_10us,
      num_events_in_100us,
      num_events_in_1ms,
      num_events_in_10ms,
      num_events_in_100ms,
      num_events_in_1s,
      num_events_in_10s,
      num_events_ge_100s,
    ]

    s = ch_zero[0] * 12 # "____________"

    counts.each_with_index do |count, index|

      next if 0 == count

      # TODO: get a faster way to count digits
      oom = Math.log10(count).to_i

      if oom < range_chars.size

        s[index] = range_chars[oom]
      else

        s[index] = ch_overflow[0]
      end
    end

    s
  end

  # Converts to string form according to default options
  def to_s

    to_strip
  end
end # class DOOMGram
end # module Diagnosticism


# ############################## end of file ############################# #


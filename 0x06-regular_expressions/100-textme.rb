#!/usr/bin/env ruby
# A regular expression matches the given pattern
puts ARGV[0].scan(/\[start at:(.*?)\]\s\[to:(.*?)\]\s\[flags:(.*?)\]/).join(',')

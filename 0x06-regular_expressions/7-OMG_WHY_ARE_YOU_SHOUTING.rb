#!/usr/bin/env ruby
# A regular expression matches only capital letters
puts ARGV[0].scan(/[A-Z]/).join

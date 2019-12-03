#!/usr/bin/env ruby

require_relative '../lib/day_one'
require_relative '../lib/utils'

if ARGV.length != 1 || !File.exist?(ARGV[0])
  puts "day_one <input file>"
  return
end

modules = Utils.read_numbers_from(:file => ARGV[0])
day_one = DayOne.new
puts "Fuel requirements for all modules: #{day_one.sum_fuel_for_all_modules(:modules => modules)}"

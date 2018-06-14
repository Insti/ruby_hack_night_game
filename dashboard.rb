#!/usr/bin/env ruby

require_relative 'lib/dashboard'

team_numbers = ARGV[0].split(',')
game = Game.new(teams: team_numbers)
puts Dashboard.new(game)

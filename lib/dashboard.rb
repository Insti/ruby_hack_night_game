#!/usr/bin/env ruby

require 'colorize'
require_relative 'game'

class Dashboard
  def initialize(game)
    @game = game
  end

  def to_s
    dashboard = "".ljust(10)
    dashboard += "Test Results".ljust(25)
    dashboard += "Rubocop Results".ljust(26)
    dashboard += "Time until last run".ljust(25)
    dashboard += "  Total"
    dashboard += "\n\n"

    game = @game


    for team in game.teams
      dashboard += "Team #{team.number}".ljust(10)
      dashboard += team.rspec_result.ljust(25).colorize(team.rspec_color)
      dashboard += team.rubocop_result.ljust(26).colorize(team.rubocop_color)
      dashboard += team.time_result.ljust(25).colorize(:white)
      dashboard += team.total_points.green
      dashboard += "\n\n"
    end


    rules = "\n * 20 points if you get 100% of the tests passing"
    rules += "\n * 10 points if you make Rubocop happy. Each offense takes one point."
    rules += "\n * 10 points if you finish in 10 minutes or less. Each additional minute takes one point."

    dashboard.bold + rules
  end
end

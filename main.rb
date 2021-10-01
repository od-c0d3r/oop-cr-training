#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'app'
require_relative 'helpers'

def main
  app = App.new

  loop do
    display_options
    selection = gets.chomp.to_i

    break if selection == 7

    action(app, selection)
  end

  puts "\nThank you for using this app\n\n"
end

main

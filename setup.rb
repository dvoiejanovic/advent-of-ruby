require 'tty-prompt'
require_relative 'scaffold'
require_relative 'scrapper'

def prompt
  TTY::Prompt.new(interrupt: :exit)
end

def display_menu
  choices = [
    { name: '🌟 Scaffold files for a delightful advent day 🌟', value: 'scaffold' },
    { name: '🎁 Scrape the festive data for an advent day 🎁', value: 'scrape' },
  ]

  prompt.select("", choices)
end

welcome_text = <<-EOL

🎅🎄 Welcome to advent of code 2023!!! 🎅🎄

Choose what action you want to perform:

EOL

puts welcome_text

def scaffold_prompt
  prompt.ask("Choose the day you want to scaffold (1-25): ") do |day|
    day.required true
    day.validate /\b(?:[1-9]|1\d|2[0-5])\b/, "Invalid input. Day must be between 1 and 25"
  end
end

def scrape_prompt
  prompt.ask("Choose the day you want to scrape (1-25): ") do |day|
    day.required true
    day.validate /\b(?:[1-9]|1\d|2[0-5])\b/, "Invalid input. Day must be between 1 and 25"
  end
end

# Main program
loop do
  user_choice = display_menu

  case user_choice
  when 'scaffold'
    day = scaffold_prompt
    scaffold(day)
    should_scrape = prompt.yes?("Do you also want to scrape data for day?")
    scrape(day) if should_scrape
  when 'scrape'
    scrape_day = scrape_prompt
    scrape(scrape_day)
  else
    puts "Invalid choice."
  end

  break
end

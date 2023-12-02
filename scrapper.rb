require 'httparty'
require_relative 'lib/utils'
require 'nokogiri'
require 'dotenv'

Dotenv.load

$cookie = ENV['AOC_COOKIE']

def fetch_response(type, day)
  url = type == "input" ? "https://adventofcode.com/2022/day/#{day}/input" : "https://adventofcode.com/2022/day/#{day}"
  HTTParty.get(url, {
    headers: {
      "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36",
      "Cookie" => $cookie
    },
  })
end


def scrape_data(day)
<<<<<<< Updated upstream
  input_file_url = "data/day#{day}.txt"
  file = create_file(input_file_url, day)
=======
  input_file_url = "data/day#{day}_part1"
  file = create_file(input_file_url, "txt", day)
>>>>>>> Stashed changes

  response = fetch_response("input", day)
  lines = response.body.split("\n");
  lines.each do |line|
    file.puts(line)
  end
end

def scrape_test_data(day)
  response = fetch_response("description", day)
  html = Nokogiri::HTML(response.body)
  test_input_els = html.css('.day-desc pre code')


  test_input_els.each_with_index do |test_input, idx|
    part_number = idx + 1
    test_file_url = "data/day#{day}_test"
    file = create_file(test_file_url, "txt", day, part_number)

    if test_input.text
      lines = test_input.text.split("\n");
      lines.each do |line|
        file.puts(line)
      end
    end

    puts "🔒 Puzzle input for part 2 is currently locked! To unlock it, solve the puzzle of part 1 and then scrape again. 🔒" if test_input_els.length == 1
    puts " "
  end
end

def scrape(day)
  create_directories(["data"])
  scrape_data(day)
  scrape_test_data(day)
end

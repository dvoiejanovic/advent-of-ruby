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
  input_file_url = "data/day#{day}.txt"
  file = create_file(input_file_url, day)

  response = fetch_response("input", day)
  lines = response.body.split("\n");
  lines.each do |line|
    file.puts(line)
  end
end

def scrape_test_data(day)
  response = fetch_response("description", day)
  html = Nokogiri::HTML(response.body)
  test_input = html.css('.day-desc pre code')

  test_file_url = "data/day#{day}_test.txt"
  file = create_file(test_file_url, day)


  if test_input.text
    lines = test_input.text.split("\n");
    lines.each do |line|
      file.puts(line)
    end
  end
end

def scrape(day)
  create_directories(["data"])
  scrape_data(day)
  scrape_test_data(day)
end

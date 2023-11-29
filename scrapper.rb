require 'httparty'
require_relative 'lib/utils'
require 'nokogiri'

$cookie = "your_cookie_here"

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
  test_input = html.css('pre code')

  spec_url = "spec/day#{day}_spec.rb"
  if test_input.text && File.exist?(spec_url)
    File.open(spec_url, "a") do |file|
      file.puts("\n")
      file.puts("=begin")
      file.puts(test_input.text)
      file.puts("=end")
    end
  end
end

def scrape(day)
  create_directories(["data"])
  scrape_data(day)
  scrape_test_data(day)
end

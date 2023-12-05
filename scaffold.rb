require 'tty-prompt'
require_relative 'lib/utils'

def create_src_file(source_file_path, day)
  file = create_file(source_file_path, "rb", day)

  content = <<-EOL
def data
  File.read("data/day#{day}.txt")
end

def day_#{day}_first_part_solution
  # your solution goes here
end

def day_#{day}_second_part_solution
  # your solution goes here
end

# puts "solution to first part is day_#{day}_first_part_solution(input)}"
# puts "solution to second part is day_#{day}_second_part_solution(input)}"
  EOL

  file.puts(content)
end

def create_spec_file(spec_file_path, day)
  file = create_file(spec_file_path, "rb", day)

  content = <<-EOL
require_relative '../src/day#{day}'

RSpec.describe "Test day #{day}" do
  it "tests the correct solution for aoc day #{day} part 1" do
    input = File.read("data/day{day}_test_part{day}.txt")
    test_solution = day_#{day}_first_part_solution(input)

    expect(test_solution).to eq(0)
  end

  it "tests the correct solution for aoc day #{day} part #2" do
    input = File.read("data/day#{day}_test_part2.txt")
    test_solution = day_#{day}_second_part_solution(input)

    expect(test_solution).to eq(0)
  end
end

  EOL

  file.puts(content)
end

def scaffold(day)
  create_directories(["spec", "src"])
  source_file_path = "src/day#{day}"
  spec_file_path = "spec/day#{day}_spec"

  if File.exist?(source_file_path)
    should_override = prompt.yes?("File #{source_file_path} already exists. Do you want to override it?")
    create_src_file(source_file_path, day) if should_override
  else
    create_src_file(source_file_path, day)
  end

  if File.exist?(spec_file_path)
    should_override = prompt.yes?("File #{spec_file_path} already exists. Do you want to override it?")
    create_spec_file(spec_file_path, day) if should_override
  else
    create_spec_file(spec_file_path, day)
  end
end

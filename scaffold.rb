require 'tty-prompt'
require_relative 'lib/utils'

def create_src_file(source_file_path, day)
  file = create_file(source_file_path, "rb", day)

  content = <<-EOL
def data
  file = File.open("data/day#{day}")
  file_data
end

def day_#{day}_solution
  # your solution goes here
end
  EOL

  file.puts(content)
end

def create_spec_file(spec_file_path, day)
  file = create_file(spec_file_path, "rb", day)

  content = <<-EOL
RSpec.describe "Test day ##{day}" do
  it "tests the correct solution for aoc day ##{day}" do
    input = File.read("data/day#{day}_test.txt").lines
    # Your test goes here
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

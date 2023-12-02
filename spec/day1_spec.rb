require_relative '../src/day1'

RSpec.describe "Test day 1" do
  it "tests the correct solution for aoc day 1 part 1" do
    input = File.read("data/day{day}_test_part{day}.txt")
    test_solution = day_1_first_part_solution(input)

    expect(test_solution).to eq(0)
  end

  it "tests the correct solution for aoc day 1 part #2" do
    input = File.read("data/day1_test_part2.txt")
    test_solution = day_1_second_part_solution(input)

    expect(test_solution).to eq(0)
  end
end


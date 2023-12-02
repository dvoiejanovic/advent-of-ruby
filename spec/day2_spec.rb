require_relative '../src/day2'

RSpec.describe "Test day 2" do
  it "tests the correct solution for aoc day 2 part 1" do
    input = File.read("data/day{day}_test_part{day}.txt")
    test_solution = day_2_first_part_solution(input)

    expect(test_solution).to eq(0)
  end

  it "tests the correct solution for aoc day 2 part #2" do
    input = File.read("data/day2_test_part2.txt")
    test_solution = day_2_second_part_solution(input)

    expect(test_solution).to eq(0)
  end
end


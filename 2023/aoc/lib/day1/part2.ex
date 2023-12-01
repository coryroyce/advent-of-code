defmodule AOC.Day1.Part2 do
  @moduledoc """
  On each line, the calibration value can be found by combining the first digit and the last digit (in that order) to form a single two-digit number.
  """

  @nums ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "zero"]
        |> Enum.join("|")

  def sum_values do
    read_input()
    |> Enum.map(&find_digits/1)
    |> Enum.sum()
  end

  def find_digits(value) do
    digits =
      Regex.scan(~r/(?=(#{@nums}|\d))/, value, capture: :all_but_first)
      |> List.flatten()
      |> Enum.map(&convert_num/1)

    digits = Enum.at(digits, 0) <> Enum.at(digits, -1)
    String.to_integer(digits)
  end

  defp convert_num("one"), do: "1"
  defp convert_num("two"), do: "2"
  defp convert_num("three"), do: "3"
  defp convert_num("four"), do: "4"
  defp convert_num("five"), do: "5"
  defp convert_num("six"), do: "6"
  defp convert_num("seven"), do: "7"
  defp convert_num("eight"), do: "8"
  defp convert_num("nine"), do: "9"
  defp convert_num("zero"), do: "0"
  defp convert_num(other), do: other

  defp read_input do
    File.read!(Application.app_dir(:aoc, "priv/day1/input.txt"))
    |> String.split("\n")
  end
end

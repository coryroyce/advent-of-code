defmodule AOC.Day1.Part1 do
  @moduledoc """
  On each line, the calibration value can be found by combining the first digit and the last digit (in that order) to form a single two-digit number.
  """

  def sum_values do
    read_input()
    |> Enum.map(&find_digits/1)
    |> Enum.sum()
  end

  def find_digits(value) do
    digits = Regex.scan(~r/\d/, value) |> List.flatten()
    digits = Enum.at(digits, 0) <> Enum.at(digits, -1)
    String.to_integer(digits)
  end

  defp read_input do
    File.read!(Application.app_dir(:aoc, "priv/day1/input.txt"))
    |> String.split("\n")
  end
end

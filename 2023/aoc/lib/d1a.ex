defmodule Day1 do
  def part1 do
    read_input()
    |> Enum.map(&parse_line/1)
    |> Enum.sum()
  end

  def part2 do
    read_input()
    |> Enum.map(&parse_line/1)
    |> Enum.map(&parse_digits/1)
    |> Enum.sum()
  end

  def read_input do
    case File.read("priv/day1/input.txt") do
      {:ok, contents} ->
        String.trim(contents) |> String.split("\n")

      {:error, _reason} ->
        []
    end
  end

  defp parse_line(line) do
    digits = Regex.scan(~r/\d+/, line)
    first_digit = String.to_integer(List.first(digits))
    last_digit = String.to_integer(List.last(digits))
    first_digit <> last_digit
  end

  defp parse_digits(line) do
    line
    |> String.split("", trim: true)
    |> Enum.map(fn char ->
      case char do
        "one" -> "1"
        "two" -> "2"
        "three" -> "3"
        "four" -> "4"
        "five" -> "5"
        "six" -> "6"
        "seven" -> "7"
        "eight" -> "8"
        "nine" -> "9"
        _ -> char
      end
    end)
    |> Enum.join()
    |> parse_line()
  end
end

# defmodule D1A do
#   def main do
#     read_input()
#     |> Enum.map(fn item -> get_coordinate_value(item) end)
#     |> Enum.sum()
#     |> IO.puts()
#   end

#   def read_input do
#     case File.read("priv/day1/input.txt") do
#       {:ok, contents} ->
#         contents
#         # Splits the contents into lines
#         |> String.split("\n", trim: true)

#       {:error, _reason} ->
#         # Returns an empty list in case of an error
#         []
#     end
#   end

#   def get_coordinate_value(coordinate_line) do
#     matches = Regex.scan(~r/\d{1}/, coordinate_line)
#     first_digit = List.first(matches) |> List.first()
#     last_digit = List.last(matches) |> List.first()
#     coordinate = String.to_integer(first_digit <> last_digit)
#   end
# end

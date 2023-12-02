defmodule D1A do
  def main do
    read_input()
    |> Enum.map(fn item -> get_coordinate_value(item) end)
    |> Enum.sum()
    |> IO.puts()
  end

  def read_input do
    case File.read("priv/day1/input.txt") do
      {:ok, contents} ->
        contents
        # Splits the contents into lines
        |> String.split("\n", trim: true)

      {:error, _reason} ->
        # Returns an empty list in case of an error
        []
    end
  end

  def get_coordinate_value(coordinate_line) do
    matches = Regex.scan(~r/\d{1}/, coordinate_line)
    first_digit = List.first(matches) |> List.first()
    last_digit = List.last(matches) |> List.first()
    coordinate = String.to_integer(first_digit <> last_digit)
  end
end

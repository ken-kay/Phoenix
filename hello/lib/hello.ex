defmodule Hello do
  @moduledoc """
  Hello keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  @doc """
  I just called, to say...hi
  """


  def hi do
    IO.puts("Hey")
  end

  @doc """
  Quick maffs
  """
  def add do
    IO.puts("Let's add 2 numbers!")
    num_1 = IO.gets("First number: ") |> String.trim() |> String.to_integer()
    num_2 = IO.gets("Second number:") |> String.trim() |> String.to_integer()
    sum_nums = num_1 + num_2
    IO.puts("The sum is: #{sum_nums}")

  end

  @doc """
  You don't breathe life into the things I do...
  """
  # shorthand subtraction
  def minus(min_1, min_2), do: min_1 - min_2

  def first(val) do
    String.trim(val)
    |> String.first()
  end

  def initial(val) do
    "#{first(val)
  |> String.capitalize()}. "
  end

  def initials(full_n) do
    list = String.split(full_n)
    Enum.map(list, fn name ->
      initial(name)
    end)
    |> List.to_string()
    |> String.trim()
  end

  def song() do
    [ "say", "something", "I'm", "giving", "up", "on", "you",
      "I'll", "be", "the", "one", "if", "you", "want", "me", "to" ]
  end

  def lyrics(song, lyrics) do
    song ++ [lyrics]
  end

  def faster(song, lyrics) do
    gnos = Enum.reverse(song)
    gnos_song = [lyrics | gnos]
    gnos_song
    |>
    Enum.reverse()
  end

  def fasterer(song, lyrics) do
    song
    |> Enum.reverse()
    |> prepend(lyrics)
    |> Enum.reverse()
  end

  defp prepend(song, lyrics) do
    [lyrics | song]
  end

  def drop(song, word) do
    List.delete_at(song, word)
  end

  def word_count(song) do
    length(song)
  end

  def check_words(song, word) do
    word in song
  end

  def fruit_loops([]), do: nil
  def fruit_loops([h | t]) do
    IO.puts(h)
    fruit_loops(t)
  end
# word search
  def you_are([], _word), do: 0
  def you_are([_head | _tail], "say"), do: 69
  def you_are([word | tail], word), do: 1 + you_are(tail, word)
  def you_are([_head | tail], word), do: you_are(tail, word)

  def twins() do
    [:Jack, :Ollie, :Ken, :Ethan]
  end

  def twins_list(:Jack) do
    {12, 150, :cm}
  end

  def twins_list(:Ollie) do
    {15, 165, :cm}
  end

  def twins_list(:Ken) do
    {18, 180, :cm}
  end

  def twins_list(:Ethan) do
    {18, 165, :cm}
  end

  def twins_list(_nameless) do
    raise "Wrong name, check your privilege."
  end

  # when guard let me know some
  def guardian(input) when is_integer(input), do: :integer
  def guardian(input) when is_float(input), do: :float
  def guardian(input) when not is_number(input), do: :not_num


  # control flow
  def check_senior(age) do
    # if age < 65, do: "Get back to work!", else: "Time to take it easy"
    unless age < 65, do: "Have a break", else: "Making paper"
  end

  # conditions
  def check_grades(mark) do
    cond do
      mark == 100 -> "Perfection"
      mark >= 50 -> "Passing grade"
      mark < 50 -> "See me after class"
      true -> "Undefined grade"
    end
  end

  def error_code(code) do
    case code do
      200 -> :ok
      502 -> :bad_gateway
      _ -> :unknown
    end
  end


  defp kg_to_lb(kg_val), do: kg_val * 2.2

  def delivery(order_id) do
    case order_id do
      {weight, unit, quantity} when weight / quantity < 10 and unit == :kg -> :valid_order
      {weight, unit, quantity} when unit == :lb ->
        if kg_to_lb(weight) / quantity < 10, do: :valid_order, else: :order_invalid
        _ -> :error
    end
  end

end

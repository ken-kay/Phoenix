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
    [ "say", "something", "I'm" ]
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
end

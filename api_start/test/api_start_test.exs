defmodule ApiStartTest do
  use ExUnit.Case
  doctest ApiStart

  test "greets the world" do
    assert ApiStart.hello() == :world
  end
end

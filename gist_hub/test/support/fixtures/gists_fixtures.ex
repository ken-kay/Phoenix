defmodule GistHub.GistsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GistHub.Gists` context.
  """

  @doc """
  Generate a gist.
  """
  def gist_fixture(attrs \\ %{}) do
    {:ok, gist} =
      attrs
      |> Enum.into(%{
        name: "some name",
        description: "some description",
        markup_text: "some markup_text"
      })
      |> GistHub.Gists.create_gist()

    gist
  end
end

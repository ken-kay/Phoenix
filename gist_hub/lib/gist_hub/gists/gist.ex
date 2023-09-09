defmodule GistHub.Gists.Gist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "gists" do
    field :name, :string
    field :description, :string
    field :markup_text, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(gist, attrs) do
    gist
    |> cast(attrs, [:name, :description, :markup_text])
    |> validate_required([:name, :description, :markup_text])
  end
end

defmodule GitClone.Gists.SavedGist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "saved_gists" do

    belongs_to :user, GitClone.Accounts.User
    belongs_to :gist, GitClone.Gists.Gist

    timestamps()
  end

  @doc false
  def changeset(saved_gist, attrs) do
    saved_gist
    |> cast(attrs, [:user_id, :gist_id])
    |> validate_required([:user_id, :gist_id])
  end
end

defmodule GitClone.Gists.Gist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "gists" do
    field :name, :string
    field :description, :string
    belongs_to :user, GitClone.Accounts.User
    has_many :comments, GitClone.Comments.Comment

    timestamps()
  end

  @doc false
  def changeset(gist, attrs) do
    gist
    |> cast(attrs, [:name, :description, :markup_text, :user_id])
    |> validate_required([:name, :description, :markup_text, :user_id])
  end
end

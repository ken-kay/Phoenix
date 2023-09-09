defmodule GitClone.Repo do
  use Ecto.Repo,
    otp_app: :git_clone,
    adapter: Ecto.Adapters.Postgres
end

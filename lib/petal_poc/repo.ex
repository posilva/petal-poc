defmodule PetalPoc.Repo do
  use Ecto.Repo,
    otp_app: :petal_poc,
    adapter: Ecto.Adapters.Postgres
end

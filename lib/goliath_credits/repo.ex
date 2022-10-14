defmodule GoliathCredits.Repo do
  use Ecto.Repo,
    otp_app: :goliath_credits,
    adapter: Ecto.Adapters.Postgres
end

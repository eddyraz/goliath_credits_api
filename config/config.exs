# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :goliath_credits,
  ecto_repos: [GoliathCredits.Repo]

# Configures the endpoint
config :goliath_credits, GoliathCreditsWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: GoliathCreditsWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: GoliathCredits.PubSub,
  live_view: [signing_salt: "eYkvpmPG"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :goliath_credits, GoliathCredits.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"


config :goliath_credits,
  creditos: %{
    "Codprestamo" => "loan_code",
    "PlanCuotas" => %{
      "Seccuota" => "quota_sec",
      "Fechainicio" => "start_date",
      "Fechavencimiento" => "due_date",
      "Fechapago" => "payment_date",
      "Diasatrcuota" => "quota_delayed_days",
      "Estadocuota" => "quota_state"
    },
    "PlanCuotasFillupValues" => %{
      "balance_sub_code" => "123456789ABCDEF",
      "delayed_quota_history_days" => 0,
      "previous_quota_state" => "UNKNOWN",
      "previous_payment_date" => ~U[1970-01-01 00:00:01Z],
      "previous_state_sub_code" => "UNKNOWN",
      "prevision_amount" => 0,
      "inte_adjust" => <<65>>,
      "bill_number" => "0",
      "plan_number" => 0
    },
    "CuotasConcepto" => %{
      "Seccuota" => "quota_sec",
      "Codconcepto" => "concept_code",
      "Numdiascalc" => "calc_number_days",
      "Montocuota" => "quota_amount",
      "Montodevengado" => "earned_amount",
      "Montopagado" => "paid_amount",
      "Fechapago" => "payment_date",
      "Estadoconcepto" => "concept_state"
    },
    "CuotasConceptoFillupValues" => %{
      "user_code" => "123456789ABCDEF",
      "condoned_amount" => 0.0000,
      "previous_paid_amount" => 0.0000,
      "previous_payment_date" => ~U[1970-01-01 00:00:01Z],
      "previous_sec_payment" => 0,
      "last_payment_penalty" => <<65>>,
      "previous_earned_amount" => 0.0000,
      "debt_balance" => 0.0000,
      "office_code" => "Miio",
      "plan_number" => 0,
      "payment_sec" => 0,
      "previous_concept_state" => "UNKNOWN"
    },
    "NullFieldFillupValues" => %{
      "Quota" => %{
        "inte_adjust" => "A",
        "balance_sub_code" => "A01",
        "bill_number" => "A",
        "delayed_quota_history_days" => 0,
        "due_date" => ~N[1970-01-01 00:00:00],
        "loan_code" => "A",
        "payment_date" => ~U[1970-01-01 00:00:00Z],
        "plan_number" => 0,
        "previous_payment_date" => ~U[1970-01-01 00:00:00Z],
        "previous_quota_state" => "A",
        "previous_state_sub_code" => "A",
        "prevision_amount" => 0.0000,
        "quota_delayed_days" => 0,
        "quota_sec" => 0,
        "quota_state" => "A",
        "start_date" => ~U[1970-01-01 00:00:00Z]
      },
      "ClientsQuota" => %{
        "calc_number_days" => 0,
        "concept_state" => "UNKNOWN",
        "condoned_amount" => "0.0000",
        "concept_code" => "UNKNOWN",
        "debt_balance" => 0.0000,
        "earned_amount" => 0.0000,
        "last_payment_penalty" => "A",
        "loan_code" => "000-00-00-00-00000",
        "office_code" => "Miio Pedregal",
        "paid_amount" => 0.0000,
        "payment_date" => ~U[1970-01-01 00:00:00Z],
        "payment_sec" => 0,
        "plan_number" => 0,
        "previous_concept_state" => "UNKNOWN",
        "previous_earned_amount" => 0.0000,
        "previous_paid_amount" => 0.0000,
        "previous_payment_date" => ~U[1970-01-01 00:00:00Z],
        "previous_sec_payment" => 0,
        "quota_amount" => 0.0000,
        "quota_sec" => 0,
        "user_code" => 0
      }
    }
  }

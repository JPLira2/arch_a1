import Config

config :assignment_1,
  ecto_repos: [Assignment1.Repo],
  generators: [timestamp_type: :utc_datetime]

config :assignment_1, Assignment1Web.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: Assignment1Web.ErrorHTML, json: Assignment1Web.ErrorJSON],
    layout: false
  ],
  pubsub_server: Assignment1.PubSub,
  live_view: [signing_salt: "5eFSpuMD"]

config :assignment_1, Assignment1.Mailer, adapter: Swoosh.Adapters.Local

config :esbuild,
  version: "0.17.11",
  assignment_1: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :tailwind,
  version: "3.4.3",
  assignment_1: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

config :mongodb_driver,
  pool_size: 10

import_config "#{config_env()}.exs"

config :assignment_1, Assignment1.Repo,
  adapter: Mongo.Ecto,
  database: "assignment_1",
  username: "admin",
  password: "dev",
  hostname: "localhost"

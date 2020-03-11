# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :chatourius,
  ecto_repos: [Chatourius.Repo]

# Configures the endpoint
config :chatourius, ChatouriusWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WVQRvtFtGW04EwrtRA+NWwoGMUIKCaloGcLP3nBjQLnVYxpgtfjIXn2HAHoDA2Oo",
  render_errors: [view: ChatouriusWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Chatourius.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "xdbWWuSs"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Chatourius.Coherence.User,
  repo: Chatourius.Repo,
  module: Chatourius,
  web_module: ChatouriusWeb,
  router: ChatouriusWeb.Router,
  password_hashing_alg: Comeonin.Bcrypt,
  messages_backend: ChatouriusWeb.Coherence.Messages,
  registration_permitted_attributes: [
    "email",
    "name",
    "password",
    "current_password",
    "password_confirmation"
  ],
  invitation_permitted_attributes: ["name", "email"],
  password_reset_permitted_attributes: [
    "reset_password_token",
    "password",
    "password_confirmation"
  ],
  session_permitted_attributes: ["remember", "email", "password"],
  email_from_name: "Your Name",
  email_from_email: "yourname@example.com",
  opts: [
    :authenticatable,
    :recoverable,
    :lockable,
    :trackable,
    :unlockable_with_token,
    :invitable,
    :registerable
  ]

config :coherence, ChatouriusWeb.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here"

# %% End Coherence Configuration %%
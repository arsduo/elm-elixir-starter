use Mix.Config

# Make sure to set your Twitter callback URL!
# It should be http://localhost:4000/auth/twitter/callback
consumer_key = "consumer key"
consumer_secret = "consumer secret"
access_token = "access token"
access_token_secret = "access token secret"

config :ueberauth, Ueberauth.Strategy.Twitter.OAuth,
  consumer_key: consumer_key,
  consumer_secret: consumer_secret

config :extwitter, :oauth, [
    consumer_key: consumer_key,
    consumer_secret: consumer_secret,
    access_token: access_token,
    access_token_secret: access_token_secret
  ]
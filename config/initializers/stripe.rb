Stripe.api_key = ENV["stripe_api_key"]
STRIPE_PUBLIC_KEY = ENV["stripe_publishable_key"]
#Stripe.setPublishableKey(STRIPE_PUBLIC_KEY)

#Rails.configuration.stripe = {
#  publishable_key: Rails.application.secrets.stripe_publishable_key,
#  secret_key: Rails.application.secrets.stripe_secret_key
#}
#Stripe.api_key = Rails.configuration.stripe[:secret_key]
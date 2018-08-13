if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_W3UcvF0Yab07I0g9xlRlo26J',
    secret_key: 'sk_test_qZDFYQzQkaSVEWFJNkAGmE1O'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
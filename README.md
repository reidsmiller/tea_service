# README

# Tea Service API

ruby version: 3.1.1
rails version: 7.0

## Database Creation:
```
  bundle install

  rails db:{create,migrate}
```

## Run test suite:
```
  bundle exec rspec spec
```

## API endpoints:

### Add tea subscription to customer:
```(ruby)
post '/api/v0/subscriptions' params: {
  title: "Green Tea Subscription",
  price: 10.51,
  frequency: [weekly: 0, monthly: 1, bimonthly: 2]
  customer_id: customer_id
  tea_id: tea_id
}
```

### Deactivate tea subscription
```(ruby)
delete '/api/v0/subscriptions/<subscription_id>'
```

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

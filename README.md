# README

# Tea Service API

ruby version: 3.1.1
rails version: 7.0

### MVP

- Creates three endpoints for customer tea subscriptions:
  - Create subscription for customer
  - Deactivate subscription for customer
  - Get all subscriptions for a customer

### Database Creation:
```
  bundle install

  rails db:{create,migrate}
```

### Schema:

<img width=98% alt="Database Diagram" src="https://github.com/reidsmiller/tea_service/assets/49500224/cbe6cca0-0379-4512-9b71-3f9d3b22140d">

### Run test suite:
```
  bundle exec rspec spec
```

## API endpoints:

### Add tea subscription to customer:
```(ruby)
post '/api/v0/customers/<customer_id>/subscriptions' params: {
  title: <"Subscription Title in String">,
  price: <price_in_float_format>,
  frequency: weekly: <0>, monthly: <1>, bimonthly: <2>
  tea_id: <tea_id>
}
```

### Deactivate tea subscription
```(ruby)
delete '/api/v0/customers/<customer_id>/subscriptions/<subscription_id>'
```

### Get all subscriptions for a customer
```(ruby)
get '/api/v0/customers/<customer_id>/subscriptions'
```

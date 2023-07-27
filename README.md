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
  title: <"Subscription Title in String">,
  price: <price_in_float_format>,
  frequency: weekly: <0>, monthly: <1>, bimonthly: <2>
  customer_id: <customer_id>
  tea_id: <tea_id>
}
```

### Deactivate tea subscription
```(ruby)
delete '/api/v0/subscriptions/<subscription_id>'
```



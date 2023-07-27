# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@customer1 = Customer.create!(first_name: 'Jane', last_name: 'Doe', email: 'jane.doe@email.com', address: '123 Main St, Denver, CO, 80202')
@customer2 = Customer.create!(first_name: 'John', last_name: 'Doe', email: 'john.doe@email.com', address: '125 Second St, Denver, CO, 80202')
@tea1 = Tea.create!(title: 'Green Tea', description: 'Green Tea Description', temperature: 200, brew_time: 5)
@tea2 = Tea.create!(title: 'Black Tea', description: 'Black Tea Description', temperature: 212, brew_time: 3)
@tea3 = Tea.create!(title: 'Oolong Tea', description: 'Oolong Tea Description', temperature: 190, brew_time: 4)
@tea4 = Tea.create!(title: 'Herbal Tea', description: 'Herbal Tea Description', temperature: 200, brew_time: 5)
@subscription1 = Subscription.create!(title: 'Green Tea Subscription', price: 10.51, frequency: 0, customer_id: @customer1.id, tea_id: @tea1.id)
@subscription2 = Subscription.create!(title: 'Black Tea Subscription', price: 10.51, frequency: 0, customer_id: @customer1.id, tea_id: @tea2.id)
@subscription3 = Subscription.create!(title: 'Oolong Tea Subscription', price: 10.51, status: 1, frequency: 0, customer_id: @customer1.id, tea_id: @tea3.id)
@subscription4 = Subscription.create!(title: 'Herbal Tea Subscription', price: 10.51, status: 1, frequency: 0, customer_id: @customer1.id, tea_id: @tea4.id)
@subscription5 = Subscription.create!(title: 'Green Tea Subscription', price: 10.51, frequency: 0, customer_id: @customer2.id, tea_id: @tea1.id)
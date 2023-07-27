require 'rails_helper'

RSpec.describe 'register new subscription' do
  before(:each) do
    @customer1 = Customer.create!(fisrt_name: 'Jane', last_name: 'Doe', email: 'jane.doe@email.com', address: '123 Main St, Denver, CO, 80202')
    @customer2 = Customer.create!(fisrt_name: 'John', last_name: 'Doe', email: 'john.doe@email.com', address: '125 Second St, Denver, CO, 80202')
    @tea1 = Tea.create!(title: 'Green Tea', description: 'Green Tea Description', temperature: 200, brew_time: 5)
    @tea2 = Tea.create!(title: 'Black Tea', description: 'Black Tea Description', temperature: 212, brew_time: 3)
    @tea3 = Tea.create!(title: 'Oolong Tea', description: 'Oolong Tea Description', temperature: 190, brew_time: 4)
    @tea4 = Tea.create!(title: 'Herbal Tea', description: 'Herbal Tea Description', temperature: 200, brew_time: 5)
  end
end
require 'rails_helper'

RSpec.describe 'register new subscription' do
  before(:each) do
    @customer1 = Customer.create!(first_name: 'Jane', last_name: 'Doe', email: 'jane.doe@email.com', address: '123 Main St, Denver, CO, 80202')
    @customer2 = Customer.create!(first_name: 'John', last_name: 'Doe', email: 'john.doe@email.com', address: '125 Second St, Denver, CO, 80202')
    @tea1 = Tea.create!(title: 'Green Tea', description: 'Green Tea Description', temperature: 200, brew_time: 5)
    @tea2 = Tea.create!(title: 'Black Tea', description: 'Black Tea Description', temperature: 212, brew_time: 3)
    @tea3 = Tea.create!(title: 'Oolong Tea', description: 'Oolong Tea Description', temperature: 190, brew_time: 4)
    @tea4 = Tea.create!(title: 'Herbal Tea', description: 'Herbal Tea Description', temperature: 200, brew_time: 5)
    @headers = { 'CONTENT_TYPE' => 'application/json' }
  end

  describe 'happy path' do
    it 'can create a new subscription' do
      post '/api/v0/subscriptions', params: {customer_id: @customer1.id, tea_id: @tea1.id, title: 'Green Tea Subscription', price: 10.00, frequency: 0}.to_json, headers: @headers

      expect(response).to be_successful
      expect(response.status).to eq(201)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body).to be_a(Hash)
      expect(response_body).to have_key(:data)
      expect(response_body[:data]).to be_a(Hash)

      expect(response_body[:data]).to have_key(:id)
      expect(response_body[:data][:id]).to be_a(String)

      expect(response_body[:data]).to have_key(:type)
      expect(response_body[:data][:type]).to be_a(String)
      expect(response_body[:data][:type]).to eq('subscription')

      expect(response_body[:data]).to have_key(:attributes)
      expect(response_body[:data][:attributes]).to be_a(Hash)

      expect(response_body[:data][:attributes]).to have_key(:title)
      expect(response_body[:data][:attributes][:title]).to be_a(String)
      expect(response_body[:data][:attributes][:title]).to eq('Green Tea Subscription')

      expect(response_body[:data][:attributes]).to have_key(:price)
      expect(response_body[:data][:attributes][:price]).to be_a(Float)
      expect(response_body[:data][:attributes][:price]).to eq(10.00)

      expect(response_body[:data][:attributes]).to have_key(:status)
      expect(response_body[:data][:attributes][:status]).to be_a(String)
      expect(response_body[:data][:attributes][:status]).to eq('active')

      expect(response_body[:data][:attributes]).to have_key(:frequency)
      expect(response_body[:data][:attributes][:frequency]).to be_a(String)
      expect(response_body[:data][:attributes][:frequency]).to eq('weekly')

      expect(response_body[:data][:attributes]).to have_key(:customer_id)
      expect(response_body[:data][:attributes][:customer_id]).to be_a(Integer)
      expect(response_body[:data][:attributes][:customer_id]).to eq(@customer1.id)

      expect(response_body[:data][:attributes]).to have_key(:tea_id)
      expect(response_body[:data][:attributes][:tea_id]).to be_a(Integer)
      expect(response_body[:data][:attributes][:tea_id]).to eq(@tea1.id)

      expect(Subscription.last.title).to eq('Green Tea Subscription')
    end
  end
end
require 'rails_helper'

RSpec.describe 'all customer subscriptions' do
  before(:each) do
    @customer = Customer.create!(first_name: 'Jane', last_name: 'Doe', email: 'jane.doe@email.com', address: '123 Main St, Denver, CO, 80202')
    @tea1 = Tea.create!(title: 'Green Tea', description: 'Green Tea Description', temperature: 200, brew_time: 5)
    @tea2 = Tea.create!(title: 'Black Tea', description: 'Black Tea Description', temperature: 212, brew_time: 3)
    @tea3 = Tea.create!(title: 'Oolong Tea', description: 'Oolong Tea Description', temperature: 190, brew_time: 4)
    @tea4 = Tea.create!(title: 'Herbal Tea', description: 'Herbal Tea Description', temperature: 200, brew_time: 5)
    @subscription1 = Subscription.create!(title: 'Green Tea Subscription', price: 10.51, frequency: 0, customer_id: @customer.id, tea_id: @tea1.id)
    @subscription2 = Subscription.create!(title: 'Black Tea Subscription', price: 10.51, frequency: 0, customer_id: @customer.id, tea_id: @tea2.id)
    @subscription3 = Subscription.create!(title: 'Oolong Tea Subscription', price: 10.51, status: 1, frequency: 0, customer_id: @customer.id, tea_id: @tea3.id)
    @subscription4 = Subscription.create!(title: 'Herbal Tea Subscription', price: 10.51, status: 1, frequency: 0, customer_id: @customer.id, tea_id: @tea4.id)
    @headers = { 'CONTENT_TYPE' => 'application/json' }
  end

  describe 'happy path' do
    it 'can get all customer subscriptions' do
      get "/api/v0/customers/#{@customer[:id]}/subscriptions", headers: @headers

      expect(response).to be_successful
      expect(response.status).to eq(200)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body).to be_a(Hash)
      expect(response_body).to have_key(:data)
      expect(response_body[:data]).to be_a(Array)

      expect(response_body[:data].count).to eq(4)
      expect(response_body[:data][0]).to be_a(Hash)

      expect(response_body[:data][0]).to have_key(:id)
      expect(response_body[:data][0][:id]).to be_a(String)
      expect(response_body[:data][0][:id]).to eq(@subscription1.id.to_s)

      expect(response_body[:data][0]).to have_key(:type)
      expect(response_body[:data][0][:type]).to be_a(String)
      expect(response_body[:data][0][:type]).to eq('subscription')

      expect(response_body[:data][0]).to have_key(:attributes)
      expect(response_body[:data][0][:attributes]).to be_a(Hash)
      expect(response_body[:data][0][:attributes].count).to eq(7)

      expect(response_body[:data][0][:attributes]).to have_key(:title)
      expect(response_body[:data][0][:attributes][:title]).to be_a(String)
      expect(response_body[:data][0][:attributes][:title]).to eq('Green Tea Subscription')

      expect(response_body[:data][0][:attributes]).to have_key(:price)
      expect(response_body[:data][0][:attributes][:price]).to be_a(Float)
      expect(response_body[:data][0][:attributes][:price]).to eq(10.51)

      expect(response_body[:data][0][:attributes]).to have_key(:status)
      expect(response_body[:data][0][:attributes][:status]).to be_a(String)
      expect(response_body[:data][0][:attributes][:status]).to eq('active')

      expect(response_body[:data][0][:attributes]).to have_key(:frequency)
      expect(response_body[:data][0][:attributes][:frequency]).to be_a(String)
      expect(response_body[:data][0][:attributes][:frequency]).to eq('weekly')

      expect(response_body[:data][0][:attributes]).to have_key(:customer_id)
      expect(response_body[:data][0][:attributes][:customer_id]).to be_a(Integer)
      expect(response_body[:data][0][:attributes][:customer_id]).to eq(@customer.id)

      expect(response_body[:data][0][:attributes]).to have_key(:tea_id)
      expect(response_body[:data][0][:attributes][:tea_id]).to be_a(Integer)
      expect(response_body[:data][0][:attributes][:tea_id]).to eq(@tea1.id)

      expect(response_body[:data][3]).to have_key(:id)
      expect(response_body[:data][3][:id]).to be_a(String)
      expect(response_body[:data][3][:id]).to eq(@subscription1.id.to_s)

      expect(response_body[:data][3]).to have_key(:type)
      expect(response_body[:data][3][:type]).to be_a(String)
      expect(response_body[:data][3][:type]).to eq('subscription')

      expect(response_body[:data][3]).to have_key(:attributes)
      expect(response_body[:data][3][:attributes]).to be_a(Hash)
      expect(response_body[:data][3][:attributes].count).to eq(7)

      expect(response_body[:data][3][:attributes]).to have_key(:title)
      expect(response_body[:data][3][:attributes][:title]).to be_a(String)
      expect(response_body[:data][3][:attributes][:title]).to eq('Green Tea Subscription')

      expect(response_body[:data][3][:attributes]).to have_key(:price)
      expect(response_body[:data][3][:attributes][:price]).to be_a(Float)
      expect(response_body[:data][3][:attributes][:price]).to eq(13.51)

      expect(response_body[:data][3][:attributes]).to have_key(:status)
      expect(response_body[:data][3][:attributes][:status]).to be_a(String)
      expect(response_body[:data][3][:attributes][:status]).to eq('cancelled')

      expect(response_body[:data][3][:attributes]).to have_key(:frequency)
      expect(response_body[:data][3][:attributes][:frequency]).to be_a(String)
      expect(response_body[:data][3][:attributes][:frequency]).to eq('weekly')

      expect(response_body[:data][3][:attributes]).to have_key(:customer_id)
      expect(response_body[:data][3][:attributes][:customer_id]).to be_a(Integer)
      expect(response_body[:data][3][:attributes][:customer_id]).to eq(@customer.id)

      expect(response_body[:data][3][:attributes]).to have_key(:tea_id)
      expect(response_body[:data][3][:attributes][:tea_id]).to be_a(Integer)
      expect(response_body[:data][3][:attributes][:tea_id]).to eq(@tea1.id)
    end
  end
end
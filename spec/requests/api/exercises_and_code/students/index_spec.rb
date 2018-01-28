require 'rails_helper'

RSpec.describe 'GET api/exercises_and_code/students' do
  context 'when format is json' do
    it 'returns a dummy list of students in json format' do
      get '/api/exercises_and_code/students'

      expect(response.status).to eq(200)
      expect(response.headers['Access-Control-Allow-Origin']).to eq('*')

      response_decoded = ActiveSupport::JSON.decode(response.body)
      expect(response_decoded['description']).to eq("This is random data generated to support TCB (https://www.techcareerbooster.com) exercises")
      expect(response_decoded['type_of_results']).to eq('students')
      expect(response_decoded['number_of_results']).to eq(100)
      expect(response_decoded['results']).to be_a(Array)
      response_decoded['results'].each do |item|
        expect(item).to have_key('id')
        expect(item).to have_key('name')
        expect(item).to have_key('email')
        expect(item).to have_key('address')
        address = item['address']
        expect(address).to have_key('street_number')
        expect(address).to have_key('city')
        expect(address).to have_key('zip_code')
        expect(address).to have_key('country')
      end
    end
  end

  context 'when format is xml' do
    it 'returns a dummy list of students in xml format' do
      get '/api/exercises_and_code/students.xml'

      expect(response.status).to eq(200)
      expect(response.headers['Access-Control-Allow-Origin']).to eq('*')

      response_decoded = Nokogiri::XML(response.body)
      expect(response_decoded.css('description').text).to eq("This is random data generated to support TCB (https://www.techcareerbooster.com) exercises")
      expect(response_decoded.css('type-of-results').text).to eq('students')
      expect(response_decoded.css('number-of-results').text).to eq('100')
      expect(response_decoded.css('results').size).to eq(1)
      expect(response_decoded.css('results').first.css('result').size).to eq(100)
      response_decoded.css('results').first.css('result').each do |xml_result|
        expect(xml_result.css('id')).to be_present
        expect(xml_result.css('name')).to be_present
        expect(xml_result.css('email')).to be_present
        expect(xml_result.css('address')).to be_present
        address = xml_result.css('address').first
        expect(address.css('street-number')).to be_present
        expect(address.css('city')).to be_present
        expect(address.css('zip-code')).to be_present
        expect(address.css('country')).to be_present
      end
    end
  end
end

require 'rails_helper'

RSpec.describe 'GET api/exercises_and_code/students' do
  it 'returns a dummy list of students in json format' do
    get '/api/exercises_and_code/students', params: {format: :json}

    expect(response.status).to eq(200)
    response_decoded = ActiveSupport::JSON.decode(response.body)
    expect(response_decoded['description']).to eq("This is random data generated to support TCB (#{root_url}) exercises")
    expect(response_decoded['type_of_results']).to eq('students')
    expect(response_decoded['number_of_results']).to eq(100)
    expect(response_decoded['results']).to be_a(Array)
    response_decoded['results'].each do |item|
      expect(item).to have_key('id')
    end
  end
end

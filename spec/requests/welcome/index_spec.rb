require 'rails_helper'

RSpec.describe 'welcome' do
  context 'GET /' do
    it 'renders the welcome index view template' do
      get '/'

      assert_select 'a[href="/api/exercises_and_code/students"]', text: 'Students List - JSON'
      assert_select 'a[href="/api/exercises_and_code/students.xml"]', text: 'XML'
      assert_select 'a[href="https://www.techcareerbooster.com"]', text: 'Courtesy of Tech Career Booster'
    end
  end
end

require 'rails_helper'

RSpec.describe 'welcome' do
  context 'GET /' do
    it 'renders the welcome index view template' do
      get '/'

      assert_select 'a[href="/api/exercises_and_code/students"]', text: 'Students List - JSON'
      assert_select 'a[href="/api/exercises_and_code/students.xml"]', text: 'XML'
    end
  end
end

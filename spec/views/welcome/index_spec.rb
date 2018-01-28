require 'rails_helper'

RSpec.describe 'welcome/index' do
  it 'has links to students index page' do
    render

    assert_select 'a[href="/api/exercises_and_code/students"]', text: 'Students List - JSON'
    assert_select 'a[href="/api/exercises_and_code/students.xml"]', text: 'XML'
  end
end

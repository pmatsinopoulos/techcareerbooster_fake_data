require 'rails_helper'

RSpec.describe 'routes' do
  it 'sends / to welcome controller index action' do
    expect(get: '/').to route_to(controller: 'welcome', action: 'index')
  end
end

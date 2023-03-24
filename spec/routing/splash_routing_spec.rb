require 'rails_helper'

RSpec.describe SplashController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/').to route_to('splash#index')
    end
  end
end

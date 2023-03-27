require 'rails_helper'

RSpec.describe ExpensesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/categories/1/expenses').to route_to('expenses#index', group_id: '1')
    end

    it 'routes to #new' do
      expect(get: 'categories/1/expenses/new').to route_to('expenses#new', group_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/categories/1/expenses/1').to route_to('expenses#show', id: '1', group_id: '1')
    end

    it 'routes to #create' do
      expect(post: '/categories/1/expenses').to route_to('expenses#create', group_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/categories/1/expenses/1').to route_to('expenses#destroy', id: '1', group_id: '1')
    end
  end
end

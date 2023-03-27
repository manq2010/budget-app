require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe 'validations' do
    it 'is valid with a name, amount and user' do
      expense = Expense.new(name: 'Expense Test', amount: 10, author_id: user.id)
      expect(expense).to be_valid
    end

    it 'is invalid without a user' do
      expense = Expense.new(name: 'Expense Test', amount: 10)
      expect(expense).not_to be_valid
      expect(expense.errors[:author_id]).to include("can't be blank")
    end

    it 'is invalid with a name' do
      expense = Expense.new(name: nil, amount: 10, author_id: user.id)
      expect(expense).not_to be_valid
      expect(expense.errors[:name]).to include("can't be blank")
    end

    it 'is invalid with a negative amount' do
      expense = Expense.new(name: nil, amount: -10, author_id: user.id)
      expect(expense).to_not be_valid
      expect(expense.errors[:amount]).to include('must be greater than or equal to 0')
    end
  end
end

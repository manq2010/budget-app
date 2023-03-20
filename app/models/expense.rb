class Expense < ApplicationRecord
  belongs_to :user
  has_many :groups, foreign_key: 'expense_id'

  validates :name, :amount, :author_id, :group_id, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end

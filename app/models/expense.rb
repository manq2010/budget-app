class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  # has_many :groups, foreign_key: 'expense_id', dependent: :destroy
  has_and_belongs_to_many :expenses

  validates :name, :amount, :author_id, :group_id, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end

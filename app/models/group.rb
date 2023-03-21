class Group < ApplicationRecord
  belongs_to :user
  # has_many :expenses, foreign_key: 'group_id', dependent: :destroy

  has_and_belongs_to_many :expenses

  validates :name, :icon, :user_id, :expense_id, presence: true
end

class Group < ApplicationRecord
  belongs_to :user
  has_many :expenses, foreign_key: 'group_id', dependent: :destroy

  validates :name, :icon, :user_id, :expense_id, presence: true
end

class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :expenses

  validates :name, :icon, :user_id, presence: true

  validates :name, length: { minimum: 3, maximum: 70 }
  validates :icon, length: { minimum: 3, maximum: 5_000 }
  validates :icon, format: { with: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https data])}\z/,
                             message: 'must be a valid URL' }
end

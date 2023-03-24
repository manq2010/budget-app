class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :expenses, foreign_key: 'author_id', dependent: :destroy
  has_many :groups, foreign_key: 'user_id', dependent: :destroy

  validates :name, :role, :email, :password, presence: true

  validates :name, length: { minimum: 3, maximum: 60 }
  validates :email, length: { minimum: 6, maximum: 100 }
  validates :password, length: { minimum: 6, maximum: 50 }

  def admin?
    role == 'admin'
  end
end

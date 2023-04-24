class Category < ApplicationRecord
  belongs_to :user
  has_many :categorizations, dependent: :destroy
  has_many :operations, through: :categorizations

  validate :user_id, presence: true
  validate :name, presence: true, uniqueness: { scope: :user_id }
  validate :icon, presence: true

  def slug
    name.parameterize
  end

  def total_amount
    operations.sum(:amount)
  end
end

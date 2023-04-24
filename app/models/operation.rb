class Operation < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  validates :name, :amount, presence: true

  before_save :set_user_id

  private

  def set_user_id
    self.user_id = author_id
  end
end

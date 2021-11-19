class Prototype < ApplicationRecord

  has_many :comments, dependent: :destroy
  belongs_to :user

  has_one_attached :imeg

  validates :title, presence: true
  validates :concept, presence: true
  validates :catch_copy, presence: true
  validates :imeg, presence: true
end

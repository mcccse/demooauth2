class Bucket < ApplicationRecord
  has_many :notes, dependent: :destroy
  belongs_to :user
  validates :user, presence: true
  validates :title, presence: true,
                    length: {minimum: 2}
end

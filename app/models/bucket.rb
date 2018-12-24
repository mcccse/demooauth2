class Bucket < ApplicationRecord
  has_many :notes, dependent: :destroy
  validates :title, presence: true,
                    length: {minimum: 2}
end

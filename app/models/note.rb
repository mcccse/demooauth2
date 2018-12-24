class Note < ApplicationRecord
  belongs_to :bucket
  validates :name, presence: true,
                    length: {minimum: 2}
end

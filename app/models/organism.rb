class Organism < ApplicationRecord
  belongs_to :user
  has_many :infections

  validates :name, presence: true
end

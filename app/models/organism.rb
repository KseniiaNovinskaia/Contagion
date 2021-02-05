class Organism < ApplicationRecord
  belongs_to :user
  has_many :infections

  validates :name, presence: true
  validates :species, inclusion: { in: %w(human pet plant) }
end

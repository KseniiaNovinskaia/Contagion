class Organism < ApplicationRecord
  belongs_to :user
  has_many :infections

  validates :name, presence: true
  validates :species, inclusion: { in: %w(human pet plant) }

  # include PgSearch::Model
  # pg_search_scope :search_by_name,
  #                 against: :name,
  #                 using: {
  #                   tsearch: { prefix: true }
  #                 }
end

class Organism < ApplicationRecord
  belongs_to :user
  has_many :infections

  validates :name, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name,
                  against: :name,
                  using: {
                    tsearch: { prefix: true }
                  }

  pg_search_scope :search_by_species,
                  against: :species
                  # using: {
                  #   tsearch: { prefix: true }
                  # }

  pg_search_scope :search_by_body_temperature,
                  against: :body_temperature
                  # using: {
                  #   tsearch: { prefix: true }
                  # }
end

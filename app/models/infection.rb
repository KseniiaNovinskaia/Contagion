class Infection < ApplicationRecord
  belongs_to :user
  belongs_to :organism

  validates :status, inclusion: { in: %w(pending active cancelled) }
end

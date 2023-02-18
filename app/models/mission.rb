class Mission < ApplicationRecord
  belongs_to :scientist
  belongs_to :planet

  validates :name, :planet, :scientist, presence: true
  validates :scientist, uniqueness: { scope: :name }
end

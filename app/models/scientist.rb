class Scientist < ApplicationRecord
  has_many :missions, dependent: :destroy
  has_many :planets, through: :missions

  validates :name, uniqueness: true
  validates :avatar, :field_of_study, presence: true
end

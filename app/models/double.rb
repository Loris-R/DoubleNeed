class Double < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :available, inclusion: { in: [ true, false ] }
  validates :price_per_day, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end

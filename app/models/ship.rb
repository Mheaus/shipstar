class Ship < ApplicationRecord
  belongs_to :user # =>owner
  belongs_to :ships_model
  has_many :bookings
  validates :name, presence: true
  # validates :category, inclusion: { in: ['Patrol craft', 'Assault Starfighter', 'Deep Space Mobile Battlestation', 'Starfighter', 'landingcraft', 'star dreadnought', 'Armed government transport', 'Escort Ship'], allow_nil: false }
  validates :address, presence: true
  validates :price, presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def daily_rent_price
    (self.price * 0.05).round
  end
end

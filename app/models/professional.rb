class Professional < ApplicationRecord
  belongs_to :user

  accepts_nested_attributes_for :user

  scope :actived, -> { where(active: true) }
  scope :with_city, ->(city) { where('city ILIKE ?', "%#{city}%") }
  scope :with_state, ->(state) { where('state ILIKE ?', "%#{state}%") }
  scope :with_occupation, ->(occupation) { where('occupation ILIKE ?', "%#{occupation}%") }
end

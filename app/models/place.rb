class Place < ApplicationRecord
  has_many :place_schedules
  
  has_many_attached :photos

  accepts_nested_attributes_for :place_schedules, allow_destroy: true
  accepts_nested_attributes_for :photos_attachments, allow_destroy: true

  enum description: {living_room: 1, meeting_room: 2, video_conference_room: 3, lounge: 4}

  validates :description, presence: true
  validates :photos, presence: true, blob: { content_type: :image }

  scope :with_city, ->(city) { where('city ILIKE ?', "%#{city}%") }
  scope :with_state, ->(state) { where('state ILIKE ?', "%#{state}%") }
  scope :with_occupation, ->(occupation) { where('occupation ILIKE ?', "%#{occupation}%") }
  scope :min_price, ->(price) { where('price_per_hour >= ?', price) }
  scope :max_price, ->(price) { where('price_per_hour <= ?', price) }
  scope :min_date, ->(date) { where('end_date >= ?', date) }
  scope :max_date, ->(date) { where('start_date <= ?', date) }
end

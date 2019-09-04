class Place < ApplicationRecord
  has_many :place_schedules
  
  has_many_attached :photos

  accepts_nested_attributes_for :place_schedules, allow_destroy: true
  accepts_nested_attributes_for :photos_attachments, allow_destroy: true

  enum description: {living_room: 1, meeting_room: 2, video_conference_room: 3, lounge: 4}

  validates :description, presence: true
  validates :photos, presence: true, blob: { content_type: :image }
end

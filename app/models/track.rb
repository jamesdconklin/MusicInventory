class Track < ActiveRecord::Base
  VERSION = %w{BONUS STANDARD}
  validates :song, :album, presence: true
  validates :version, inclusion: VERSION
  validates :ord, numericality: { minimmum: 0 }

  belongs_to(
    :album,
    class_name: :Album,
    foreign_key: :album_id,
    primary_key: :id
  )

  has_one(
    :band,
    through: :album,
    source: :band
  )
end

class Album < ActiveRecord::Base
  RECORDED = %w{LIVE STUDIO}
  validates :title, :band, presence: true
  validates :recorded, inclusion: RECORDED

  belongs_to(
    :band,
    class_name: :Band,
    foreign_key: :band_id,
    primary_key: :id
  )

  has_many(
    :tracks,
    class_name: :Track,
    foreign_key: :album_id,
    primary_key: :id,
    dependent: :destroy
  )
end

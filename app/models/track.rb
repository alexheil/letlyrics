class Track < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :artist
  belongs_to :album
  belongs_to :user

  scope :alpha, -> { order('name') }
  scope :recent, -> { order("created_at DESC") }

  validates :name, :uniqueness => {:scope => :album_id}, presence: true, length: { maximum: 150 }
  validates :content, presence: true, length: { maximum: 25000 }
  validates :slug, presence: true, :uniqueness => {:scope => :album_id}

  before_save :should_generate_new_friendly_id?, if: :name_changed?

  private

    def should_generate_new_friendly_id?
      name_changed?
    end

    def slug_candidates
      [:name, [:name, :album_id], [:name, :album_id, :artist_id], [:name, :album_id, :artist_id, "#{Track.all.count + 1}"]]
    end

end

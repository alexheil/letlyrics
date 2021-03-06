class Album < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :artist
  has_many :tracks, dependent: :destroy

  scope :alpha, -> { order('name') }
  scope :recent, -> { order("created_at DESC") }

  validates :name, :uniqueness => {:scope => :artist_id}, presence: true, length: { maximum: 100 }
  
  before_save :should_generate_new_friendly_id?, if: :name_changed?

  private

    def should_generate_new_friendly_id?
      name_changed?
    end

    def slug_candidates
      [:name, [:name, "#{Album.all.count + 1}"]]
    end

end

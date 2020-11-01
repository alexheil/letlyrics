class Artist < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  has_many :albums, dependent: :destroy
  has_many :tracks, dependent: :destroy

  default_scope -> { order('name') }

  validates :name, presence: true, uniqueness: true, length: { maximum: 40 }

  before_save :should_generate_new_friendly_id?, if: :name_changed?

  def self.search(search)
    where("artist_name iLIKE ?", "%#{search}%")
  end

  private

    def should_generate_new_friendly_id?
      name_changed?
    end

    def slug_candidates
      [:name, [:name, "#{Artist.all.count + 1}"]]
    end

end

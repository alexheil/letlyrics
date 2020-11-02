class User < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :login

  scope :popular, -> {select("users.id, users.slug, users.username, count(tracks.id) tracks_count").joins(:tracks).group("users.id").reorder("tracks_count desc").limit(10)}

  has_many :tracks

  before_validation :generate_username

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z0-9 ]+\Z/i }
  validate :validate_username

  before_save :should_generate_new_friendly_id?, if: :username_changed?
  before_save :downcase_username

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  private

    def generate_username
      require 'securerandom' 
      random = SecureRandom.hex(2)

      username = self.email.split("@").first if self.username.blank?

      if User.where(username: username).exists?
        self.username = username + "ll#{random}"
      else
        self.username = username
      end
      self.slug = self.username if self.slug.blank?
      puts self.username
      puts self.slug
    end

    def should_generate_new_friendly_id?
      username_changed?
    end

    def downcase_username
      self.username = username.downcase
    end

    def slug_candidates
      [:username, [:username, "#{User.all.count + 1}"]]
    end
    
end

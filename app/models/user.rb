class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :profile, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  has_one_attached :profile_image
  attribute :new_profile_image

  before_save do
    if new_profile_image
      self.profile_image = new_profile_image
    end
  end

  has_many :entries, dependent: :destroy
end

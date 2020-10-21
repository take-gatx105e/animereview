class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :profile, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  has_many :entries, dependent: :destroy

  has_one_attached :profile_image
  attribute :new_profile_image
  
  validate if: :new_profile_image do
    if new_profile_image.respond_to?(:content_type)
      unless new_profile_image.content_type.in?(ALLOWED_CONTENT_TYPES)
        errors.add(:new_profile_image, :invalid_image_type)
      end
    else
      errors.add(:new_profile_image, :invalid)
    end
  end
  
  before_save do
    if new_profile_image
      self.profile_image = new_profile_image
    end
  end
end

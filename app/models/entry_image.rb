class EntryImage < ApplicationRecord
  belongs_to :entry

  validates :alt_text, presence: true

  has_one_attached :profile_entry_image
  acts_as_list scope: :entry

  attribute :new_profile_entry_image

  validates :new_profile_entry_image, presence: { on: :create }

  validate if: :new_profile_entry_image do
    if new_profile_entry_image.respond_to?(:content_type)
      unless new_profile_entry_image.content_type.in?(ALLOWED_CONTENT_TYPES)
        errors.add(:new_profile_entry_image, :invalid_entry_image_type)
      end
    else
      errors.add(:new_profile_entry_image, :invalid)
    end
  end

  before_save do
    if new_profile_entry_image
      self.profile_entry_image = new_profile_entry_image
    end
  end
end

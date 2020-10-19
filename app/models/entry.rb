class Entry < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 255 }
  validates :introduction, presence: true, length: { maximum: 2000 }
end

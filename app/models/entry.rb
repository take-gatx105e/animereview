class Entry < ApplicationRecord
  belongs_to :user
  has_many :images, class_name: "EntryImage", dependent: :destroy

  has_one :evaluation, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :introduction, presence: true, length: { maximum: 2000 }
end

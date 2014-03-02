class Project < ActiveRecord::Base
  validates :technologies_used, presence: true
  validates :name, length: { in: 4..255 }

  has_many :comments, as: :commentable, :dependent => :destroy

  mount_uploader :image, ImageUploader
end

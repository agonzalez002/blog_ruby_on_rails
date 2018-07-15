require 'carrierwave/orm/activerecord'

class Post < ApplicationRecord
  mount_uploader :file, PostUploader

  belongs_to :user
  
  validates :file, presence: true
end

class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :prototypes, through: :taggings
end

# app/models/like.rb
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :prototype
end

class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :prototype

  enum action_type: { like: "like", comment: "comment" }

  validates :user_id, presence: true
  validates :prototype_id, presence: true
  validates :action_type, presence: true
end

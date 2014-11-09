class Feeling < ActiveRecord::Base
  enum mood: [:good, :bad, :indifferent]

  belongs_to :user

  validates :user, presence: true
  validates :mood, presence: true
  validates :description, presence: true
end

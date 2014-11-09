class Feeling < ActiveRecord::Base
  enum mood: [:good, :bad, :indifferent]
  validates :mood, presence: true
  validates :description, presence: true
end

class Game < ActiveRecord::Base
  # add the accessors for the two fields
  attr_accessor :starts_at_date, :starts_at_time
  belongs_to :organizer, class_name: "User", foreign_key: "organizer_id"

  has_many :hunts
  has_many :locations, through: :hunts

  has_many :plays
  has_many :users, through: :plays

  has_many :game_histories

  reverse_geocoded_by :latitude, :longitude, :address => :address
  after_validation :reverse_geocode  # auto-fetch address
end

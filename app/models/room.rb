class Room < ActiveRecord::Base
  has_many :events
end

class User < ApplicationRecord
  has_many :locations
  serialize :passed 

end

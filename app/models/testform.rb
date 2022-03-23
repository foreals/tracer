class Testform < ApplicationRecord
  belongs_to :user

  validates :date, presence:true

  RESULT = ["Positive", "Negative"]

  validates :RESULT, presence:true
  
end

class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :tweet_text, :presence => true
end

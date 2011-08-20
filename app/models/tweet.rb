class Tweet < ActiveRecord::Base
  SET_SIZE = 5
  scope :latest_set, order("id desc").limit(SET_SIZE)
  scope :next_set, lambda { |latest_id| where("id > ?", latest_id).limit(SET_SIZE) }
end

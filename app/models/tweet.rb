class Tweet < ActiveRecord::Base
  SET_SIZE = 5
  scope :latest_set, limit(SET_SIZE).order("id desc")
  scope :next_set, lambda { |latest_id| where("id > ?", latest_id).limit(SET_SIZE) }
end

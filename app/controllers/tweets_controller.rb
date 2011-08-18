class TweetsController < ApplicationController
  def index
    @tweets = Tweet.where("created_at > ?", params[:after])
                   .order("created_at desc")
                   .limit(15)
    @latest_tweet = Time.new
  end
end

class TweetsController < ApplicationController
  def index
    @tweets = Tweet.where("created_at > ?", params[:after])
                   .order("created_at desc")
    @latest_tweet = Time.new
  end
end

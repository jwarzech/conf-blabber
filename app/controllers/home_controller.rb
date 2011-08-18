class HomeController < ApplicationController
  def index
    @latest_tweet = Time.new
    @tweets = Tweet.order("created_at desc").limit(15)
  end

end

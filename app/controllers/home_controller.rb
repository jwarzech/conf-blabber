class HomeController < ApplicationController
  def index
    @latest_tweet = Time.new
    @tweets = Tweet.all
  end

end

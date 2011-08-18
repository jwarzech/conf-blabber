class TweetsController < ApplicationController
  def index
    unless params[:after] == 0
      @tweets =  Tweet.next_set(params[:after])
    else
      @tweets = Tweet.latest_set
    end
    @latest_tweet = @tweets.maximum(:id)
  end
end

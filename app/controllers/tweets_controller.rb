class TweetsController < ApplicationController
  def index
    unless params[:after] == 0
      @tweets =  Tweet.next_set(params[:after])
    else
      @tweets = Tweet.latest_set
    end
    
    unless @tweets.nil? || @tweets.empty?
      @tweets.sort_by! { |t| t.id }
      @latest_tweet = @tweets.last.id
    end
  end
end

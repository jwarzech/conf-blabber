require 'twitter'

class CheckTwitterJob < Struct.new(:hash_tag)
  def enqueue(job)
     RAILS_DEFAULT_LOGGER.info("\n Check Twitter Job Queued \n")
  end
  
  def perform
    
    RAILS_DEFAULT_LOGGER.info("\n Check Twitter Job Running #{hash_tag} \n")
    
    # Retrieve latest tweets
    search = Twitter::Search.new
    results = search.hashtag(hash_tag).no_retweets.page(1).fetch
    
    results.each do |result|
      tweet = Tweet.new
      tweet.tweet_id = result.id
      tweet.user_name = result.from_user
      tweet.user_image_url = result.profile_image_url
      tweet.text = result.text
      tweet.save
    end
  end
  
  def success(job)
     RAILS_DEFAULT_LOGGER.info("\n Check Twitter Job Successful \n")
  end
  
  def error(job, exception)
     RAILS_DEFAULT_LOGGER.error("\n Check Twitter Job Error #{exception.message}\n")
  end
  
  def failure
     RAILS_DEFAULT_LOGGER.error("\n Check Twitter Failure \n")
  end
end
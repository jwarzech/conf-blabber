require 'twitter'

class CheckTwitterJob < Struct.new(:hash_tag)
  def enqueue(job)
     RAILS_DEFAULT_LOGGER.info("\n Check Twitter Job Queued \n")
  end
  
  def perform   
    RAILS_DEFAULT_LOGGER.info("\n Check Twitter Job Running #{hash_tag} \n")
    
    # Get latest tweet to use as baseline
    latest_tweet_id = Tweet.maximum('tweet_id')
    
    search = Twitter::Search.new
    unless(latest_tweet_id.nil?)
      # Retrieve latest tweets since baseline
      results = search.hashtag(hash_tag).no_retweets
                      .since_id(latest_tweet_id).fetch
    else
      # Setup the initial set of tweets for topic
      results = search.hashtag(hash_tag).no_retweets
                      .page(1).fetch
    end
    
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
     Delayed::Job.enqueue(CheckTwitterJob.new(hash_tag), 1.minute.from_now)
  end
  
  def error(job, exception)
     RAILS_DEFAULT_LOGGER.error("\n Check Twitter Job Error #{exception.message}\n")
  end
  
  def failure
     RAILS_DEFAULT_LOGGER.error("\n Check Twitter Failure \n")
  end
end
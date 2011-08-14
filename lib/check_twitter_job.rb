class CheckTwitterJob < Struct.new(:hash_tag)
  def enqueue(job)
     RAILS_DEFAULT_LOGGER.info("\n Check Twitter Job Queued \n")
  end
  
  def perform
    RAILS_DEFAULT_LOGGER.info("\n Check Twitter Job Running \n")
  end
  
  def success(job)
     RAILS_DEFAULT_LOGGER.info("\n Check Twitter Job Successful \n")
  end
  
  def error(job, exception)
     RAILS_DEFAULT_LOGGER.error("\n Check Twitter Job Error \n")
  end
  
  def failure
     RAILS_DEFAULT_LOGGER.error("\n Check Twitter Failure \n")
  end
end
require 'check_twitter_job.rb'

task :start_polling, [:hash_tag] => :environment do |t, args|
  Delayed::Job.enqueue(CheckTwitterJob.new(args[:hash_tag]))
end
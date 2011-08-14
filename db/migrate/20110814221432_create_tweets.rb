class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.string :tweet_id
      t.string :text
      t.string :user_name
      t.string :user_image_url
      t.timestamps
    end
  end

  def self.down
    drop_table :tweets
  end
end

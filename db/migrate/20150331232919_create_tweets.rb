class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.column :username, :string
      t.column :handle, :string
      t.column :tweet_text, :string
      t.column :user_id, :integer
      t.column :hashtag, :string

      t.timestamps
    end
  end
end

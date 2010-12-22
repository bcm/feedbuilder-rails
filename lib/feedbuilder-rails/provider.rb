class ActiveRecord::Base
  def self.acts_as_feed_provider(options = {})
    extend FeedBuilder::Provider

    self.feed_id_domain = options[:feed_id_domain]
    self.feed_id_date = options[:feed_id_date]
    self.feed_id_path = options[:feed_id_path]
    self.feed_id = options[:feed_id]
  end
end

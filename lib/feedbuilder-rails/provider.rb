class ActiveRecord::Base
  def self.acts_as_feed_provider(options = {})
    unless (options.include?(:feed_id_domain) && options.include?(:feed_id_path)) || options.include?(:feed_id)
      raise ArgumentError, 'Must include either :feed_id_domain and :feed_id_path or :feed_id'
    end

    extend FeedBuilder::Provider

    self.feed_id_domain = options[:feed_id_domain]
    self.feed_id_date = options[:feed_id_date]
    self.feed_id_path = options[:feed_id_path]
    self.feed_id = options[:feed_id]
  end
end

Miniblog::Post.class_eval do
  belongs_to :category

  delegate :name, to: :category, prefix: true

  scope :about_me, -> { where(cms: true, permalink: 'about-me') }

  def to_param
    "#{id}-#{permalink}"
  end

  alias_method :purge_all!, :purge_all

  def purge_all
    if Rails.env.production?
      purge_all!
    else
      Rails.logger.debug("Purge Cache: #{table_key}")
    end
  end
end


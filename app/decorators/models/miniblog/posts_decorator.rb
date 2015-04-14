Miniblog::Post.class_eval do
  belongs_to :category

  delegate :name, to: :category, prefix: true

  scope :about_me, -> { where(cms: true, permalink: 'about-me') }

  def to_param
    "#{id}-#{permalink}"
  end
end


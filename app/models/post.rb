class Post < Crowdblog::Post
  belongs_to :category

  delegate :name, to: :category, prefix: true

  def to_param
    "#{id}-#{permalink}"
  end
end

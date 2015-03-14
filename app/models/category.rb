class Category < ActiveRecord::Base
  has_many :posts, class_name: "Crowdblog::Post"
end

Crowdblog::Post.class_eval do
  belongs_to :category
end

class Category < ActiveRecord::Base
  has_many :posts, class_name: "Miniblog::Post"
end

Miniblog::Post.class_eval do
  belongs_to :category
end

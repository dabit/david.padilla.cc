class CreateSomeDefaultCategories < ActiveRecord::Migration
  def change
    Category.create(name: "Leadership")
    Category.create(name: "Programming")
  end
end

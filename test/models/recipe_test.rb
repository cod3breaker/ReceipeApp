require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    @recipe = Recipe.new(name: "Chicken Fried Rice", summary: "This is a dumb Chicken fried rice recipe",
                         description: "Add all the ingredients and cook with oil")
 end

 test "recipe should be valid" do
   assert @recipe.valid?
 end

 test "name should be valid" do
   @recipe.name = ""
   assert_not @recipe.valid?
 end

 test "name is must have minimum 5 characters" do
   @recipe.name = "aaaa"
   assert_not @recipe.valid?
 end
end

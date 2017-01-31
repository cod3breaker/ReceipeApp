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

 test "name must not exceed 100 characters" do
   @recipe.name = "a"*101
   assert_not @recipe.valid?
 end

 test "summary must be present before saving" do
   @recipe.summary = ""
   assert_not @recipe.valid?
 end

 test "summary must be more than 10 characters" do
   @recipe.summary = "a"*9
   assert_not @recipe.valid?
 end

 test "summary must be less than 150 characters" do
   @recipe.summary = "a"*151
   assert_not @recipe.valid?
 end

 test "description must be present before saving" do
   @recipe.description = ""
   assert_not @recipe.valid?
 end

 test "description must have a minimum of 20 characters" do
   @recipe.description = "a"*19
   assert_not @recipe.valid?
 end
end

require "test_helper"

class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(chefname: "Guesto", email: "guesto@ratatoille.com")
  end

  test "chefname must not be empty" do
    @chef.chefname = ""
    assert_not @chef.valid?
  end

  test "chefname must not shorter than 3 characters" do
    @chef.chefname = "aa"
    assert_not @chef.valid?
  end

  test "chefname must not be longer than 40 characters" do
    @chef.chefname = "a"*41
    assert_not @chef.valid?
  end

  # Testcases for email field
  test "email must be presence" do
    @chef.email = ""
    assert_not @chef.valid?
  end

  test "email length must be within the limits" do
    @chef.email = "a" * 101 + "@example.com"
    assert_not @chef.valid?
  end
end

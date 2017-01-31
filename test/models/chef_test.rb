require "test_helper"

class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(chefname: "Guesto", email: "guesto@ratatoille.com")
  end

  test "chefname must not be empty" do
    @chef.chefname = ""
    assert_not @chef.valid?
  end
end
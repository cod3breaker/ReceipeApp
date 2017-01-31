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

  test "email must be unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end

  test "email validation must not accept invalid email addresses" do
    valid_addresses = %w[john@abc,xyz R_EDTabc.wer.au doe@e_e.abc john.doe@abc. jane+joe@x+yz.abc]
    valid_addresses.each do |va|
      @chef.email = va
      assert_not @chef.valid?
    end
  end
end

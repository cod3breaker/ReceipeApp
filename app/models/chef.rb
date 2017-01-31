class Chef < ActiveRecord::Base
  validates :chefname, presence: true
end

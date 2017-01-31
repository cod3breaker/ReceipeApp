class Chef < ActiveRecord::Base
  validates :chefname, presence: true, length: {minimum: 3}
end

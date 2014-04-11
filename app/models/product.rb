class Product < ActiveRecord::Base
  validates :price, presence: true, numericality: {
      :greater_than => 0, :less_than => 100_000.00 }
end

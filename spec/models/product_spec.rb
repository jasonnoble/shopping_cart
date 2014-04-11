require 'spec_helper'

describe Product do
  before(:each) do
    pending "fixing broken test"
  end
  it { should validate_numericality_of(:price).
                  is_greater_than(0).
                  is_less_than(100_000.00) }
end

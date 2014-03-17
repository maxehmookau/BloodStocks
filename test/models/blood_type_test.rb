require 'test_helper'

class BloodTypeTest < ActiveSupport::TestCase
  test '#name returns correct name for blood type names' do
    assert_equal 'Apos', blood_types(:Apos).name
  end
end

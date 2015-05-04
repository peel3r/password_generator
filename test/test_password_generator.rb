require 'minitest/autorun'
require 'password_generator'

class PasswordGeneratorTest < Minitest::Test
  def test_alpha
    50.times do
      assert_match /^[[:alpha:]]+$/, PasswordGenerator.generate
    end
  end


end

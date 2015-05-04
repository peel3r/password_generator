require 'minitest/autorun'
require 'password_generator'

class PasswordGeneratorTest < Minitest::Test
  def test_alpha
    50.times do
      password =  PasswordGenerator.generate
      assert_match /^[[:alpha:]]+$/, password
    end
  end

  def test_unique
    50.times do
      password =  PasswordGenerator.generate(unique: true)
      assert_match /^[[:alpha:]]+$/, password
      assert_equal password.size, password.chars.uniq.size
    end
  end


end

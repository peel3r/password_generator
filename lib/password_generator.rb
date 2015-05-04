require "password_generator/version"

module PasswordGenerator
  ASCII = ('!'..'~')
  ALPHA = ASCII.grep(/[[:alpha:]]/)
  DIGIT = ASCII.grep(/[[:digit:]]/)
  PUNCT = ASCII.grep(/[[:punct:]]/)
end

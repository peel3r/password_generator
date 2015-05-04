module PasswordGenerator
  ASCII = ('!'..'~')
  ALPHA = ASCII.grep(/[[:alpha:]]/)
  DIGIT = ASCII.grep(/[[:digit:]]/)
  PUNCT = ASCII.grep(/[[:punct:]]/)

  def self.generate(unique: false)
    alpha = ALPHA.dup
    (1..20).map do
      if unique
        alpha.delete_at(rand(alpha.size))
      else
        alpha.sample
      end
    end.join
  end
end

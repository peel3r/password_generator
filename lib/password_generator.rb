module PasswordGenerator
  ASCII = ('!'..'~')
  ALPHA = ASCII.grep(/[[:alpha:]]/)
  DIGIT = ASCII.grep(/[[:digit:]]/)
  PUNCT = ASCII.grep(/[[:punct:]]/)

  def self.generate(unique: false, punct: 0 , length: 20)

    punct_ary = PUNCT.dup
    alpha_ary = ALPHA.dup
    ((1..(length - punct)).map do
     sample(alpha_ary, unique)
    end + (1..punct).map do
      sample(punct_ary, unique)
    end).shuffle.join
  end

  def self.sample(collection, unique)
    if unique
      collection.delete_at(rand(collection.size))
    else
      collection.sample
    end
  end
end

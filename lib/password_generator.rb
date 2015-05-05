module PasswordGenerator
  ASCII = ('!'..'~')
  ALPHA = ASCII.grep(/[[:alpha:]]/)
  UPPER = ASCII.grep(/[[:upper:]]/)
  LOWER = ASCII.grep(/[[:lower:]]/)
  DIGIT = ASCII.grep(/[[:digit:]]/)
  PUNCT = ASCII.grep(/[[:punct:]]/)

  def self.generate(unique: false, punct: 0 ,digit: 0, upper: nil , length: 20)
    if upper
      default_sampler = Sampler.new(LOWER, unique)
    else
      default_sampler = Sampler.new(ALPHA, unique)
    end
    punct_sampler = Sampler.new(PUNCT, unique)
    upper_sampler = Sampler.new(UPPER, unique)
    digit_sampler = Sampler.new(DIGIT, unique)
    ((1..(length - punct - digit - upper.to_i)).map do
      default_sampler.sample
    end + (1..punct).map do
      punct_sampler.sample
    end + (1..digit).map do
      digit_sampler.sample
    end + (1..upper.to_i).map do
      upper_sampler.sample
    end).shuffle.join
  end

  def self.sample(collection, unique)
    if unique
      collection.delete_at(rand(collection.size))
    else
      collection.sample
    end
  end

  class Sampler
    def initialize(ary, unique)
      @ary, @unique = ary.dup, unique
    end

    def sample
      if @unique
        @ary.delete_at(rand(@ary.size))
      else
        @ary.sample
      end
    end
  end
end

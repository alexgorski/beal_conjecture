class Possibility < ActiveRecord::Base
  validates_uniqueness_of :a, scope: [:b, :c, :x, :y, :z]
  validates_uniqueness_of :b, scope: [:a, :c, :x, :y, :z]
  validates_uniqueness_of :c, scope: [:a, :b, :x, :y, :z]
  validates_uniqueness_of :x, scope: [:b, :c, :a, :y, :z]
  validates_uniqueness_of :y, scope: [:b, :c, :x, :a, :z]
  validates_uniqueness_of :z, scope: [:b, :c, :x, :y, :a]
  PRIMES = File.readlines('./primes-to-100k.txt').map!{|p|p.to_i}
  def self.create_next
    count, @next = Possibility.fetch_equality
    @next.state = "equality"
    if @next.valid?
      @next.save!
      puts ["Yay", @next.a, @next.b, @next.c, @next.x, @next.y, @next.z].join("-")
      Possibility.create_next
    else
      Possibility.create_next
    end
  end

  def self.fetch_random
    a = rand(0..PRIMES.size)
    b = rand(0..PRIMES.size)
    c = rand(0..PRIMES.size)
    x,y = rand(3..15), rand(3..15)
    x >= y ? z = rand(x..20) : z = rand(y..20)
    result = Possibility.new(
        a: a,
        b: b,
        c: c,
        x: x,
        y: y,
        z: z)
    return result
  end

  def self.fetch_equality
    counter = 1
    @random = Possibility.fetch_random
    until @random.test_for_equality do
      counter += 1
      puts counter if (counter % 100000) == 0
      @random = Possibility.fetch_random
    end
    return counter, @random
  end

  def test_for_equality
    (a**x + b**y) == c**z ? true : false
  end

  def self.generate_odd_random(n,m)
    odd = rand(n..m)
    odd % 2 == 0 ? self.generate_odd_random(n,m) : odd
  end

  def self.generate_non_multiple(a,b,n,m)
    c = rand(3..100)
    return c unless c % a == 0 or c % b == 0 or a % c == 0 or b % c == 0
    Possibility.generate_non_multiple(a,b,n,m)
  end
end

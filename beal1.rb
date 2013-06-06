require 'prime'
require 'pry'
class Beal

  def initialize
    @a = rand(3..1000)
    @b = rand(3..1000)
    @c = rand(3..1000)
    @x = rand(3..1000)
    @y = rand(3..1000)
    @z = rand(1000..10000)
  end
  
  def conjecture
   (@a**@x + @b**@y) == @c**@z ? true : false
  end

  def prime_base?(a,b,c)

  end
end

@my_array = []
i = 0
while @my_array.size <= 10
@beal = Beal.new
i += 1
puts i
  if @beal.conjecture
    @my_array << @beal
    binding.pry
    puts @my_array.size
  else
  end
end
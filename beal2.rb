def find_beal
  a=rand(3..1000)
  b=rand(3..1000)
  c=rand(1000..2000)
  x=rand(3..1000)
  y=rand(3..1000)
  z=rand(3..1000)
  (a**x + b**y) == c**z ? [a,b,c,x,y,z] : nil
end
@my_array = []
i = 0
while @my_array.size <= 10
  b = find_beal

  if b != nil 
    @my_array << b 
    binding.pry
  end
i += 1
puts i
end
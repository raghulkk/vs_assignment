=begin
  5.A boomerang is a V-shaped sequence that is either upright or upside down. 
Specifically, a boomerang can be defined as: sub-array of length 3, with 
the first and last digits being the same and the middle digit being different.
=end

def count_boomerangs(arr)

 array = arr.each_cons(3).to_a

 count = 0

array.each do |elem|

    if elem[0] == elem[2] && elem[0] != elem[1]

      count += 1

    end

end

count

end

p count_boomerangs([3, 7, 3, 2, 1, 5, 1, 2, 2, -2, 2])
p count_boomerangs([1, 7, 1, 7, 1, 7, 1])
p count_boomerangs([1, 1, 1, 2, 3, 4, 5, 6, 1, 6])
p count_boomerangs([9, 5, 9, 5, 1, 1, 1])
p count_boomerangs([5, 6, 6, 7, 6, 3, 9]) 
p count_boomerangs([4, 4, 4, 9, 9, 9, 9]) 



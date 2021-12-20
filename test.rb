def find_one_using_hash_map(array)
  map = {}
  array.each do |v|
    map[v] = (map[v] || 0) + 1
  end

  map.select { |_key, value| value > 1 }
end

p find_one_using_hash_map([1,2,3,4,5,1]).length

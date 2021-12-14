start = [3,4,3,1,2]

def hash(start)
  hash = {8 => 0, 7 => 0, 6 => 0, 5 => 0, 4 => 0, 3 => 0, 2 => 0, 1 => 0, 0 => 0}
  start.each do |number|
    hash[number] += 1
  end
  return hash
end

hash = hash(start)

def reproduce(days, hash)
  count = 0
  while count < days
    hash2 = {8 => 0, 7 => 0, 6 => 0, 5 => 0, 4 => 0, 3 => 0, 2 => 0, 1 => 0, 0 => 0}
    hash2[8] = hash[0]
    hash2[7] = hash[8]
    hash2[6] = hash[7] + hash[0]
    hash2[5] = hash[6]
    hash2[4] = hash[5]
    hash2[3] = hash[4]
    hash2[2] = hash[3]
    hash2[1] = hash[2]
    hash2[0] = hash[1]
    hash = hash2
    p hash
    count += 1
  end
  return hash
end

p reproduce(18, hash)

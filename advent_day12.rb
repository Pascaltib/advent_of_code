data = "start-A
start-b
A-c
A-b
b-d
A-end
b-end"

arr = []
data.each_line do |line|
  arr << line.gsub("\n", "").split("-")
end

hash = {}
arr.each do |line|
  # left side

  unless hash.key?(line[0])
    hash[line[0]] = []
  end
  # add value to key
  hash[line[0]] << line[1]

  # right side exclude declaring end as value
  unless hash.key?(line[1]) || line[1] == "end"
    hash[line[1]] = []
  end
  # add value to key unless its end as key or start as value
  hash[line[1]] << line[0] unless line[0] == "start" || line[1] == "end"
end

def path_search(cave, hash)
  p cave
  hash[cave].each do |cave_choice|
    return true if cave_choice == "end"

    path_search(cave_choice, hash)
  end

  return false
end

finished = false
while finished == false do
  hash["start"].each do |cave|
    finished = path_search(cave, hash)
  end
end

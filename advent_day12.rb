data = "start-A
start-b
A-c
A-b
b-d
A-end
b-end"

arr = []
data.each_line{ |line| arr << line.gsub("\n", "").split("-")}

data_hash = {}
arr.each do |link|
  # If hash doesn't have left side as key
  unless data_hash.key?(link[0])
    data_hash[link[0]] = []
  end
  # If hash doesn't have the right side as key
  if data_hash.key?(link[1]) == false && link[1] != "end"
    data_hash[link[1]] = []
  end
  #Add both links
  unless link[0] == "start" || link[1] == "end"
    data_hash[link[1]] << link[0]
  end

  data_hash[link[0]] << link[1]


end
p data_hash

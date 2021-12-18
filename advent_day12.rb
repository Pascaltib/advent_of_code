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
  # If hash doesn't have the right side as key without adding end
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

# def recursive_path_search(args)
#   args[:data_hash][args[:current_path][-1]].each do |option|
#     args[:current_path] << option

#     recursive_path_search({})
#   end
# end

# path_arr = []
# current_path = ["start"]
# recursive_path_search({ current_path: current_path, path_arr: path_arr, data_hash: data_hash })

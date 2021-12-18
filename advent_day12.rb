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

def recursive_path_search(args)

  p args[:path_arr]
  p "this is option: #{args[:option]}"

  args[:path_arr] << args[:option]

  if args[:option] != "end" && args[:path_arr].length > 2 && args[:path_arr][(args[:path_arr].length-2)] != args[:option]
    args[:data_hash][args[:option]].each do |option|
      recursive_path_search({path_arr: args[:path_arr], option: option, data_hash: args[:data_hash]})
    end
  else
    "Path Done"
  end


  return args[:path_arr]
end
p data_hash["start"][0]
p data_hash["start"][1]
path_arr = []
data_hash["start"].each do |option|
  path_arr = recursive_path_search({path_arr: path_arr, option: option, data_hash: data_hash})
end

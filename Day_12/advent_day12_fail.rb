# rubocop:disable LineLength
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
    unless link[1] == "start" || link[1] == "end"
      data_hash[link[1]] << link[0]
    end
    data_hash[link[0]] << link[1]
end

def recursive_path_search(args)
  p "Current cave:"
  p args[:current_path]
  p "Current data hash:"
  p args[:data_hash]
  if args[:current_path][-1] == "end"
    $path_arr << args[:current_path]
  else
    unless args[:data_hash][args[:current_path][-1]]
      p "dead end"
      return false
    end

    args[:data_hash][args[:current_path][-1]].each do |option|
      args[:current_path] << option
      # Delete whole key
      if args[:current_path][-2] != args[:current_path][-2].upcase
        args[:data_hash].delete(args[:current_path][-2])
      end
      # Delete all instances of lowercase value
      args[:data_hash].each do |key, value|
        if value.include?(args[:current_path][-2]) && args[:current_path][-2] != args[:current_path][-2].upcase
          value = value.delete(args[:current_path][-2])
        end
       args[:data_hash].delete(key) if value == []
      end
      value = recursive_path_search({ current_path: args[:current_path], path_arr: args[:path_arr], data_hash: args[:data_hash] })
      if value
        args[:path_arr]
      end
    end
  end
  args[:path_arr]
end

$path_arr = []
current_path = ["start"]
p recursive_path_search({ current_path: current_path, data_hash: data_hash })

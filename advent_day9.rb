data = "2199943210
3987894921
9856789892
8767896789
9899965678"

arr = []
data.each_line{ |line| arr << line.gsub("\n", "").split("")}
sum = 0

low_points = []
arr.each_with_index do |line, line_index|
  line.each_with_index do |num, num_index|
    # arr that holds adjacent values
    check_arr = []
    # Check that line above exists and save up value
    check_arr << arr[line_index-1][num_index].to_i if line_index > 0

    # Check if left value exists and if so save left value
    check_arr << arr[line_index][num_index - 1].to_i if num_index > 0

    #Check if bottom line exists and if so save bottom value
    check_arr << arr[line_index + 1][num_index].to_i if arr[line_index + 1]

    #Check if right value exists and if so save right value
    check_arr << arr[line_index][num_index + 1].to_i if arr[line_index][num_index + 1]

    #Check if it is lower
    if num.to_i < check_arr.min
      sum += (num.to_i + 1)
      low_points << [line_index, num_index]
    end
  end
end

def recursive_basin_search(args)
  # Top
  if args[:low_point][0] > 0 && args[:arr][args[:low_point][0]-1][args[:low_point][1]] > args[:arr][args[:low_point][0]][args[:low_point][1]] && args[:arr][args[:low_point][0]-1][args[:low_point][1]].to_i < 9 && (args[:basin_pts].include? [args[:low_point][0]-1,args[:low_point][1]]) == false
    p "Low point: #{args[:low_point]}"
    p "top function"
    args[:basin_pts] << [args[:low_point][0]-1,args[:low_point][1]]
    values = recursive_basin_search({basin_pts: args[:basin_pts], arr: args[:arr], low_point: [args[:low_point][0]-1,args[:low_point][1]]})
    args[:basin_pts] = values[:basin_pts]
  end

  # Left
  if args[:low_point][1] > 0 && args[:arr][args[:low_point][0]][args[:low_point][1]-1] > args[:arr][args[:low_point][0]][args[:low_point][1]] && args[:arr][args[:low_point][0]][args[:low_point][1]-1].to_i < 9 && (args[:basin_pts].include? [args[:low_point][0],args[:low_point][1]-1]) == false
    p "Low point: #{args[:low_point]}"
    p "top function"
    args[:basin_pts] << [args[:low_point][0],args[:low_point][1]-1]
    values = recursive_basin_search({basin_pts: args[:basin_pts], arr: args[:arr], low_point: [args[:low_point][0],args[:low_point][1]-1]})
    args[:basin_pts] = values[:basin_pts]
  end

  # Bottom
  if args[:arr][args[:low_point][0]+1] && args[:arr][args[:low_point][0]+1][args[:low_point][1]] > args[:arr][args[:low_point][0]][args[:low_point][1]] && args[:arr][args[:low_point][0]+1][args[:low_point][1]].to_i < 9 && (args[:basin_pts].include? [args[:low_point][0]+1,args[:low_point][1]]) == false
    p "Low point: #{args[:low_point]}"
    p "top function"
    args[:basin_pts] << [args[:low_point][0]+1,args[:low_point][1]]
    values = recursive_basin_search({basin_pts: args[:basin_pts], arr: args[:arr], low_point: [args[:low_point][0]+1,args[:low_point][1]]})
    args[:basin_pts] = values[:basin_pts]
  end

  # Right
  if args[:arr][args[:low_point][0]][args[:low_point][0]+1] && args[:arr][args[:low_point][0]][args[:low_point][1]+1] > args[:arr][args[:low_point][0]][args[:low_point][1]] && args[:arr][args[:low_point][0]][args[:low_point][1]+1].to_i < 9 && (args[:basin_pts].include? [args[:low_point][0],args[:low_point][1]+1]) == false
    p "Low point: #{args[:low_point]}"
    p "top function"
    args[:basin_pts] << [args[:low_point][0],args[:low_point][1]+1]
    values = recursive_basin_search({basin_pts: args[:basin_pts], arr: args[:arr], low_point: [args[:low_point][0],args[:low_point][1]+1]})
    args[:basin_pts] = values[:basin_pts]
  end

  return  {basin_pts: args[:basin_pts]}
end

# def recursive_basin_search(low_pnt, size, arr, basin_pts)
#   unless basin_pts.include? low_pnt
#     # Top
#     if low_pnt[0] > 0 && arr[low_pnt[0]-1][low_pnt[1]] > arr[low_pnt[0]][low_pnt[1]] && arr[low_pnt[0]-1][low_pnt[1]].to_i < 9
#       size += 1
#       basin_pts << low_pnt
#       values = recursive_basin_search([low_pnt[0]-1, low_pnt[1]], size, arr, basin_pts)[0]
#       size = values[0]
#       basin_pts = values[1]
#     end
#     # Left
#     if low_pnt[1] > 0 && arr[low_pnt[0]][low_pnt[1]-1] > arr[low_pnt[0]][low_pnt[1]] && arr[low_pnt[0]][low_pnt[1]-1].to_i < 9
#       size += 1
#       basin_pts << low_pnt
#       values = recursive_basin_search([low_pnt[0]-1, low_pnt[1]], size, arr, basin_pts)[0]
#       size = values[0]
#       basin_pts = values[1]
#     end
#     # Bottom
#     if arr[low_pnt[0] + 1] && arr[low_pnt[0]+1][low_pnt[1]] > arr[low_pnt[0]][low_pnt[1]] && arr[low_pnt[0]+1][low_pnt[1]].to_i < 9
#       size += 1
#       basin_pts << low_pnt
#       values = recursive_basin_search([low_pnt[0]-1, low_pnt[1]], size, arr, basin_pts)[0]
#       size = values[0]
#       basin_pts = values[1]
#     end
#     # Right
#     if arr[low_pnt[0]][low_pnt[1] + 1] && arr[low_pnt[0]][low_pnt[1]+1] > arr[low_pnt[0]][low_pnt[1]] && arr[low_pnt[0]][low_pnt[1]+1].to_i < 9
#       size += 1
#       basin_pts << low_pnt
#       values = recursive_basin_search([low_pnt[0]-1, low_pnt[1]], size, arr, basin_pts)[0]
#       size = values[0]
#       basin_pts = values[1]
#     end
#   end
#   return [size, basin_pts]
# end
p recursive_basin_search({low_point: [4, 6], arr: arr, basin_pts: [[4,6]]})

# Need to store low points into array so that I don't use them twice

# low_points.each do |low_pnt|
#   size = 0
#   recursive_basin_search(low_pnt, size, arr)
# end

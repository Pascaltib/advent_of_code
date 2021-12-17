data = "5483143223
2745854711
5264556173
6141336146
6357385478
4167524645
2176841721
6882881134
4846848554
5283751526"

arr = []
data.each_line{ |line| arr << line.gsub("\n", "").split("").map {|string| string.to_i}}

def recursive_flash_method(args)

  to_flash = []
  # For each point check if adjacent exists, then make value += 1. If this results in a value of 10 add to to_flash
  # Then for each point in to_flash increase flash_sum and run recursive_flash_method on that point
  # At the end go through array and any value more than 9 should become 0
  # point in arr = args[:arr][args[:point][0]][args[:point][1]]

  # Top left
  if args[:point][0] > 0 && args[:point][1] > 0
    args[:arr][args[:point][0]-1][args[:point][1]-1] += 1
    if args[:arr][args[:point][0]-1][args[:point][1]-1] == 10
      to_flash << [args[:point][0]-1, args[:point][1]-1]
    end
  end
  # Top
  if args[:point][0] > 0
    args[:arr][args[:point][0]-1][args[:point][1]] += 1
    if args[:arr][args[:point][0]-1][args[:point][1]] == 10
      to_flash << [args[:point][0]-1, args[:point][1]]
    end
  end
  # Top Right
  if args[:point][0] > 0 && args[:arr][args[:point][0]-1][args[:point][1]+1]
    args[:arr][args[:point][0]-1][args[:point][1]+1] += 1
    if args[:arr][args[:point][0]-1][args[:point][1]+1] == 10
      to_flash << [args[:point][0]-1, args[:point][1]+1]
    end
  end
  # Left
  if args[:point][1] > 0
    args[:arr][args[:point][0]][args[:point][1]-1] += 1
    if args[:arr][args[:point][0]][args[:point][1]-1] == 10
      to_flash << [args[:point][0], args[:point][1]-1]
    end
  end
  # Right
  if args[:arr][args[:point][0]][args[:point][1]+1]
    args[:arr][args[:point][0]][args[:point][1]+1] += 1
    if args[:arr][args[:point][0]][args[:point][1]+1] == 10
      to_flash << [args[:point][0], args[:point][1]+1]
    end
  end
  # Bottom Left
  if args[:arr][args[:point][0]+1] && args[:point][1] > 0
    args[:arr][args[:point][0]+1][args[:point][1]-1] += 1
    if args[:arr][args[:point][0]+1][args[:point][1]-1] == 10
      to_flash << [args[:point][0]+1, args[:point][1]-1]
    end
  end
  # Bottom
  if args[:arr][args[:point][0]+1]
    args[:arr][args[:point][0]+1][args[:point][1]] += 1
    if args[:arr][args[:point][0]+1][args[:point][1]] == 10
      to_flash << [args[:point][0]+1, args[:point][1]]
    end
  end
  # Bottom Right
  if args[:arr][args[:point][0]+1] && args[:arr][args[:point][0]+1][args[:point][1]+1]
    args[:arr][args[:point][0]+1][args[:point][1]+1] += 1
    if args[:arr][args[:point][0]+1][args[:point][1]+1] == 10
      to_flash << [args[:point][0]+1, args[:point][1]+1]
    end
  end

  args[:flash_sum] += to_flash.length
  to_flash.each do |point|
    values = recursive_flash_method({ point: point, arr: args[:arr], flash_sum: args[:flash_sum] })
    args[:flash_sum] = values[0]
    args[:arr] = values[1]
  end
  return [args[:flash_sum], args[:arr]]
end



# Testing with Day 5 flashes - works!!
# test_arr = [[10,8,8],[7,10,8]]

# point = [0,0]
# test_sum = 2
# values = recursive_flash_method({ point: point, arr: test_arr, flash_sum: test_sum })
# test_arr = values[1]
# test_sum = values[0]
# p test_arr
# point = [1,1]
# p recursive_flash_method({ point: point, arr: test_arr, flash_sum: test_sum })

# code below not working must test one point at a time

flash_total = 0
100.times do
  initial_flashes = []
  arr.each_with_index do |line, index|
    line.each_with_index do |number, index2|
      arr[index][index2] += 1
      if arr[index][index2] == 10
        initial_flashes << [index, index2]
      end
    end
  end

  flash_total += initial_flashes.length
  initial_flashes.each do |point|
    values = recursive_flash_method({ point: point, arr: arr, flash_sum: flash_total })
    flash_total = values[0]
    arr = values[1]
  end
  arr.each_with_index do |line, index|
    line.each_with_index do |number, index2|
      if arr[index][index2] > 9
        arr[index][index2] = 0
      end
    end
  end
end
p flash_total

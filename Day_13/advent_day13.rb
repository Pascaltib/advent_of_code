data = File.new('data.txt').read
arr = []
data.each_line { |line| arr << line.gsub("\n", '').split(",").map { |string| string.to_i}}

# Find grid dimensions
max_x = 0
max_y = 0
arr.each do |point|
  max_x = point[0] if point[0] > max_x
  max_y = point[1] if point[1] > max_y
end
paper_grid = Array.new(max_y+1){Array.new(max_x+1)}
arr.each do |point|
  paper_grid[point[1]][point[0]] = "#"
end
p paper_grid.length

def y_fold(paper_grid)
  translation_grid = Array.new(paper_grid.length){Array.new(paper_grid[0].length)}
  mid_y_pnt = paper_grid.length / 2
  count = mid_y_pnt
  while count < paper_grid.length
    paper_grid[count].each_with_index do |point, index|
      translation_grid[paper_grid.length-count-1][index] = "#" if paper_grid[count][index] == "#"
    end
    count += 1
  end
  paper_grid.each_with_index do |line, index|
    line.each_with_index do |point, index2|
      paper_grid[index][index2] = "#" if translation_grid[index][index2] == "#"
    end
  end
  paper_grid.slice(0, paper_grid.length/2)
end

def x_fold
  translation_grid = Array.new(paper_grid.length){Array.new(paper_grid[0].length)}
  mid_y_pnt = paper_grid.length / 2
  count = mid_y_pnt
  while count < paper_grid.length
    paper_grid[count].each_with_index do |point, index|
      translation_grid[paper_grid.length-count-1][index] = "#" if paper_grid[count][index] == "#"
    end
    count += 1
  end
  paper_grid.each_with_index do |line, index|
    line.each_with_index do |point, index2|
      paper_grid[index][index2] = "#" if translation_grid[index][index2] == "#"
    end
  end
  paper_grid.slice(0, paper_grid.length/2)
end

p y_fold(paper_grid)

data = File.new("data.txt").read
arr = []
data.each_line do |line|
  arr << line.gsub("\n", "").split("")
end
x_len = arr[0].length - 1
y_len = arr.length - 1

For a single path I will need to keep track of what positions I have used before

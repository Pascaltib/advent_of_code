data = File.open('data.txt').read
arr = []
data.each_line do |line|
  arr << line.gsub("\n", '').split('-')
end

# Create hash with possible paths
hash = {}
arr.each do |line|
  # left side
  hash[line[0]] = [] unless hash.key?(line[0]) || line[0] == 'end'

  # add value to key
  hash[line[0]] << line[1] if hash[line[0]]

  # right side exclude declaring end as value
  hash[line[1]] = [] unless hash.key?(line[1]) || line[1] == 'end'

  # add value to key unless its end as key or start as value
  hash[line[1]] << line[0] unless line[0] == 'start' || line[1] == 'end'
end
p hash

# Node class
class Node
  attr_accessor :val, :children

  def initialize(val)
    @val = val
    @children = []
  end

  def this.total
    @total += 1
  end
end

# Function to declare instances of node
def node_declaration(cave, hash, smallcaves)
  # Add lowercase values to smallcaves array
  smallcaves += [cave.val] if cave.val != cave.val.upcase && cave.val != 'end'

  # hash key exists?
  if hash[cave.val]
    hash[cave.val].each do |option|
      # Stop recursion if repeating small cave
      next if smallcaves.include? option

      temp = Node.new(option)
      cave.children << temp
      node_declaration(temp, hash, smallcaves)
    end
  end
end

# Function to count instances of end
def dfs(node, count)
  count += 1 if node.val == 'end'

  node.children.each do |child|
    count = dfs(child, count)
  end
  count
end

root = Node.new('start')
smallcaves = []
node_declaration(root, hash, smallcaves)


count = 0
print dfs(root, count)

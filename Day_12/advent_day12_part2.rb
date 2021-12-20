data = File.open('data.txt').read
arr = []
data.each_line do |line|
  arr << line.gsub("\n", '').split('-')
end

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
end

def find_duplicates(array)
  hash = {}
  array.each do |v|
    hash[v] = (hash[v] || 0 ) + 1
  end
  hash.select { |_key, value| value > 1}
end

def node_declaration(cave, hash, smallcaves)
  p smallcaves if cave.val == "end"
  smallcaves += [cave.val] if cave.val != cave.val.upcase && cave.val != 'end'

  # hash key exists?
  if hash[cave.val]
    hash[cave.val].each do |option|
      duplicates = find_duplicates(smallcaves)
      next if duplicates.length > 1 || (duplicates.values.include? (3))

      temp = Node.new(option)
      cave.children << temp
      node_declaration(temp, hash, smallcaves)
    end
  end
end

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

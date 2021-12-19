data = "fs-end
he-DX
fs-he
start-DX
pj-DX
end-zg
zg-sl
zg-pj
pj-he
RW-he
fs-DX
pj-RW
zg-RW
start-pj
he-WI
zg-he
pj-fs
start-RW"

arr = []
data.each_line do |line|
  arr << line.gsub("\n", "").split("-")
end

hash = {}
arr.each do |line|
  # left side

  unless hash.key?(line[0])
    hash[line[0]] = []
  end
  # add value to key
  hash[line[0]] << line[1]

  # right side exclude declaring end as value
  unless hash.key?(line[1]) || line[1] == "end"
    hash[line[1]] = []
  end
  # add value to key unless its end as key or start as value
  hash[line[1]] << line[0] unless line[0] == "start" || line[1] == "end"
end

class Node
  attr_accessor :val, :children

  def initialize(val)
    @val = val
    @children = []
  end
end

def node_declaration(cave, hash, smallCaves, currentPath)
  currentPath = currentPath + [cave.val]
  if currentPath[-1] == "end"
    p currentPath
  end
  if cave.val != cave.val.upcase && cave.val != "end"
    smallCaves = smallCaves + [cave.val]
  end
  # hash key exists?
  if hash[cave.val]
    hash[cave.val].each do |option|
      unless smallCaves.include? option
        temp = Node.new(option)
        cave.children << temp
        node_declaration(temp, hash, smallCaves, currentPath)
      end
    end
  end
end

def dfs(node,count)
  count += 1 if node.val == "end"

  node.children.each do |child|
    count = dfs(child, count)
  end
  count
end

root = Node.new("start")
smallCaves = []
currentPath = []
node_declaration(root, hash, smallCaves, currentPath)
count = 0
print dfs(root, count)

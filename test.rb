class Node
  attr_accessor :val, :children

  def initialize(val)
    @val = val
    @children = []
  end
end
root = Node.new(3)
child_l = Node.new(9)
child_r = Node.new(20)
grand_child_r_l = Node.new(15)
grand_child_r_r = Node.new(7)
grand_child_l_l = Node.new(33)
child_r.children << grand_child_r_l
child_r.children << grand_child_r_r
child_l.children << grand_child_l_l
root.children << child_r
root.children << child_l

def dfs(node)
  p node.val

  node.children.each do |child|
    dfs(child)
  end
end
dfs(root)

require "byebug"
class PolyTreeNode

  attr_reader :value
  attr_accessor :parent, :children
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(parent_node)
    @parent.children.delete(self) unless @parent.nil?
    
    @parent = parent_node
    parent_node.children << self unless parent_node.nil?
  end 

  def inspect
    self.value
  end 

  def add_child(child_node)
    unless child_node.children.include?(self)
        child_node.parent = self
    end 
  end 

  def remove_child(child_node)
    if self.children.include?(child_node)
        child_node.parent = nil
    else
       raise "child not included"
    end 
  end 

  def dfs(target_value)
    return self if target_value == self.value
    self.children.each do |child|
      val = child.dfs(target_value)
      return val unless val.nil?
    end
    nil
  end 

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      checked = queue.shift
    #   debugger
      return checked if checked.value == target_value
      queue += checked.children
    end
    nil
  end

end
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

  end 
end
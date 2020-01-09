class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    self.prev.next = self.next if self.prev
    self.next.prev = self.prev if self.next
    self.next = nil
    self.prev = nil
    self
  end
end

class LinkedList
  include Enumerable
  
  attr_reader :head, :tail

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    self.each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    return nil if self.empty?
    self.head.next
  end

  def last
    return nil if self.empty?
    self.tail.prev
  end

  def empty?
    self.head.next == self.tail
  end

  def get(key)
    self.each do |node|
      return node.val if node.key == key
    end 
  end

  def include?(key)
    self.each do |node|
      return true if node.key == key
    end
    false
  end

  def append(key, val)
    new_node = Node.new(key,val)
    prev_last = self.tail.prev
    prev_last.next = new_node
    new_node.next = self.tail
    new_node.prev = prev_last
    tail.prev = new_node
  end

  def update(key, val)
    self.each do |node|
      node.val = val if node.key == key
    end 
  end

  def remove(key)
    each do |node|
      if node.key == key
        node.remove
        return node.val
      end
    end

    nil
  end

  def each
    current_node = self.head.next
    until current_node == self.tail
      yield current_node 
      current_node = current_node.next
    end 
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end

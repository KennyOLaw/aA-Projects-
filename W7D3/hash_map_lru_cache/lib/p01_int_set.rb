class MaxIntSet
  attr_reader :store, :max

  def initialize(max)
      @max = max
      @store = Array.new(max, false)
  end

  def insert(num)
    is_valid?(num)
    store[num] = true
  end

  def remove(num)
    is_valid?(num)
    store[num] = false 
  end

  def include?(num)
    store[num] == true
  end

  private

  def is_valid?(num)
    raise "Out of bounds" unless (0...max).include?(num)
    true
  end

  def validate!(num)
    include?(num)
  end
end


class IntSet
  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    return false if include?(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    i = num % num_buckets
    self.store[i]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if self.include?(num)
    self[num] << num 
    @count += 1
    resize! if self.count > num_buckets
  end

  def remove(num)
    return unless self.include?(num)
    self[num].delete(num)
    @count -= 1
  end

  def include?(num)
    self[num].include?(num)
  end

  private
  attr_accessor :store

  def [](num)
    i = num % num_buckets
    store[i]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_size = num_buckets * 2
    old_store = store.dup
    @count = 0
    @store = Array.new(new_size){Array.new}
    old_store.flatten.each do |item|
      insert(item)
    end 
  end
end

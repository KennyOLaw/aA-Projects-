class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if self.include?(key)
    self[key.hash] << key 
    @count += 1
    resize! if self.count > num_buckets
    key
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    return nil unless self.include?(key)
    self[key.hash].delete(key)
    @count -= 1
  end

  private

  def [](num)
    self.store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_size = num_buckets * 2
    old_store = @store.dup
    @count = 0
    @store = Array.new(new_size){Array.new}
    old_store.flatten.each do |item|
      insert(item)
    end 
  end
end

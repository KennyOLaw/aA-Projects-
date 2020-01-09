class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    acc = 0
    self.each_with_index do |el,i|
      acc += el.hash ^ i.hash 
    end
    acc
  end
end

class String
  def hash
    chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    acc = 0
    to_a.each do |sub|
      acc += sub.hash
    end 
    acc
  end
end

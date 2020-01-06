class Array 
  def my_transpose 
    raise IndexError if self.any? {|ele| ele.length != self[0].length}
    raise TypeError unless self.all? {|ele| ele.is_a(Array)}
    transposed = []
    self[0].length.times do |idx|
      col = []
      self.each_with_index do |ele, idx2|
        col << self[idx][idx2]
      end 
      transposed << col
    end
    transposed
  end 

  def two_sum
    sums = []
    (0...self.length - 1).each { |idx|
      (idx+1...self.length).each { |idx2| 
        sums << [idx, idx2] if self[idx] + self[idx2] == 0
      }
    }
    sums
  end

  def my_unique
    unique = []
    self.each do |ele|
      unique << ele unless unique.include?(ele)
    end
    unique 
  end 

end 
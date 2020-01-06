class Array 
  def two_sum
    sums = []
    (0...self.length - 1).each { |idx|
      (idx...self.length).each { |idx2| 
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
require "byebug"
class Array 
  def my_transpose 
    raise TypeError unless self.all? {|ele| ele.is_a?(Array)}
    raise IndexError if self.any? {|ele| ele.length != self[0].length}

    transposed = []
    self[0].length.times do |idx|
      col = []
      self.each_with_index do |ele, idx2|
        col << self[idx2][idx]
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

def stock_picker(month)
  delta = 0
  days = []
  month.each_with_index {|day, idx|
    month[(idx + 1)..-1].each_with_index do |sell_day, idx2|
      if delta < sell_day - day  
        debugger if idx == 1 && idx2 == 9
        delta = sell_day - day
        days = [idx, idx + idx2]
      end 
    end 
  }
  days

end 
class Array 

    def my_unique
        unique = []
        self.each do |ele|
            unique << ele unless unique.include?(ele)
        end
        unique 
    end 

end 
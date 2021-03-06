# PHASE 2
def convert_to_int(str)
  return Integer(str) 
rescue 
  return nil
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]
class CoffeeError < StandardError
end 

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise CoffeeError if maybe_fruit == "coffee"
    raise StandardError 

  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 
rescue CoffeeError
    retry 
end  

class BestieError < StandardError 
end

class RealNameError < StandardError 
end

# PHASE 4
class BestFriend

  def initialize(name, yrs_known, fav_pastime)
    raise RealNameError if name.empty? || name.split(' ').count < 2

    @name = name

    raise BestieError if yrs_known < 5

    @yrs_known = yrs_known

    raise BestieError if fav_pastime.empty?
    @fav_pastime = fav_pastime

  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end



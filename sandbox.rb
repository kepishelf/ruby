
#Int i 
i = 2
puts i

#===========================================================================

# init a hash to values of zero, then count words and put sums into this Hash
word_frequency = Hash.new(0) 
puts "hash init: #{word_frequency}"
sentence = "Chicka chicka boom boom jeff warvel boom chik" 
sentence.split.each do |word| 
  word_frequency[word.downcase] += 1 
  #puts "counting #{word}, currval = #{word_frequency[word.downcase]}"
end 
print "hash result : "
puts word_frequency 		# => {"chicka" => 2, "boom" => 2}
# sort has by key or value and do desc / reverse sort
# puts word_frequency.sort_by {|word, count| count}.reverse
printf " hash 'word' with highest count : "
puts word_frequency.sort_by {|word, count| count}.last[0]
printf " hash  highest count for that word  : "
puts word_frequency.sort_by {|word, count| count}.last[1]
# Sorting a Hash with numbers
#   ex:   people.sort_by { |name, age| age }


#===========================================================================

puts "-------------- Using the double pipes"
class PersonE
  attr_reader   :age      # create the getter methods for age
  attr_accessor :name     # creates getter, setter for name
  attr_reader   :gender


  def initialize (name, ageVar, gender) # CONSTRUCTOR 
    @name = name 
    self.age = ageVar     # call the age= method . "self" is required here. (when inside the method)
    @gender = gender
  end 
  # age setter method
  def age= (new_age) 
    @age ||="n/a"     # Default - use age if set, else use "n/a"
    @age = new_age unless ( new_age > 120  or new_age < 0 )   # put bounds on the age setting
  end 
end 
person1 = PersonE.new("Jeff Warvel",13,"M")
puts "Resulting person object.age:  #{person1.age}"
puts person1.name
puts person1.gender



#===========================================================================
# HASH and ARRAY - sorting, converting

#{ "x" => 1, "y" => 2, "z" => 3 }.each_with_object({}) {|(k,v),o| o[k.to_sym]=v }
jhash = { "Eggs" => 12, "Milk" => 2, "Bread" => 3 }

# Converting hash to Array
puts jhash
puts "Parsing hash : "
jhash.each_with_object({}) { |(k,v),o|  puts "k=#{k} v=#{v} o=#{o} " }
arr1 = jhash.to_a
puts "Convert to array, and Pull out 2D items"
printf "  Array= "; p arr1

# Loop / Parse from a 2D array
puts "Parsing array : "
arr1.each_with_index { |item, i| puts "i=#{i} item= #{item[0]} #{item[1]} " }


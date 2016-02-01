#  a Person and Census example -   PersonCensus.rb
class Person
   @@no_of_person = 0
   # cfg the getter, setter methods
   attr_accessor :name, :age, :sex
   def initialize(in_name, in_age, in_sex)
   	 @name = in_name
   	 @age = in_age
   	 @sex = in_sex
   end

   def adult 
   	 if (@age >= 18) 
   	 	return true
   	 else
   	 	return false
   	 end
   end
end

class Home
  attr_accessor :yearbuilt, :person_cnt, :members, :addr
  def initialize(in_year, in_addr)
    @members = []        # list of Person objects in the house
    @person_cnt = 0	
    @yearbuilt = in_year
    @addr = in_addr
    # now add all Person objects to array of members
  end  
  
  def create_members( in_person)
	  @members << in_person
	  @person_cnt += 1
  end
end

class City
end

# first create a Home object
h1 = Home.new(1923, "5120 Broadway")
puts "Home : #{h1.addr} ,  buit : #{h1.yearbuilt} "


[["jeff",53,"M"], ["kelly", 47, "F"]].each_with_index do |key, i|
  puts "arr elem : #{key.flatten}"
  # to parse a 2D array
  # key.each_with_index do | elem , i |;   	puts elem;   end
  p1 = Person.new( key[0], key[1], key[2])
  #p1 = Person.new(key.split('.',0),"","")
  #puts "i = #{i}  name = #{p1.name}"
  h1.create_members( p1 )
end  


#h1 = Home.new(1923)

if ( h1.members[0].nil?	) 
  puts "Home members list is empty"
end

# add the Person to members listing in Home Object

if ( h1.members[0].nil?	) 
  puts "Home members list is empty"
else
  puts "Home members array is populated with Person Objects"
end  
h1.members.each do |obj|
  puts "Home members: #{obj.name}, #{obj.age}, #{obj.sex}"
end 
puts "total Census: #{h1.person_cnt}"

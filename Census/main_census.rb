# main file for testing PersonCensus.rb  classes
# main_census.rb
#
require_relative "PersonCensus"

#

# ==================================================================================================== #
# MAIN 

# first create a Home object
h1 = Home.new(1923, "5120 Broadway")
puts "Home : #{h1.addr} ,  buit : #{h1.yearbuilt} "

#  testing if home member list is empty
if ( h1.members[0].nil?	) 
  puts "Home Object  members list is empty"
end
# get total members added so far
#puts h1.set_output
puts "Home members Added -> output_cnt instance var : #{h1.output_cnt}"

# Add people to the Home - each Person object is added to the Home.members --> an array of Person objects.
[["jeff",53,"M"], ["kelly", 47, "F"]].each_with_index do |key, i|
  puts "ADDING person to #{h1.addr}   arr elem : #{key.flatten}"
  # to parse a 2D array
  # key.each_with_index do | elem , i |;   	puts elem;   end
  p1 = Person.new( key[0], key[1], key[2] )
  #p1 = Person.new(key.split('.',0),"","")
  #puts "i = #{i}  name = #{p1.name}"
  h1.create_members( p1 )
end  




# testing for empty list
if ( h1.members[0].nil?	) 
  puts "- Home members list is empty"
else
  puts "- Home members array is populated with : #{h1.person_cnt} Person Objects"
end  

# add the Person to members listing in Home Object
puts "---- FINAL home members:  #{h1.addr} ,  buit : #{h1.yearbuilt} "
h1.members.each do |obj|
  puts "Home members: #{obj.name}, #{obj.age}, #{obj.sex}"
end 
puts "total Census: #{h1.person_cnt}"


# Create the City
c1 = City.new( "Indianapolis", "IN")

# add the first home above : h1 to this City
c1.add_homes( h1 )

# Add more homes 
[[1964,"1075 W. 91st St."], [1950,"7550 Zionisville Rd."], [1998, "10742 Gettysburg Pl"]].each_with_index do |key, i|
  # puts "ADDING home to #{h1.addr}   arr elem : #{key.flatten}"
  home_temp = Home.new( key[0], key[1] )
  # puts "i = #{i}  home.yearbuilt = #{home_temp.yearbuilt}"
  c1.add_homes( home_temp )
end  

puts c1.name

c1.home_list.each do |obj|
  puts "Homes in City #{c1.name} :  #{obj.addr}, #{obj.yearbuilt} "
end 

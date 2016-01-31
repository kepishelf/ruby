
# Ruby : understanding Classes. Instance and Class level variables
# reference : http://www.railstips.org/blog/archives/2006/11/18/class-and-instance-variables-in-ruby/
#

class Planet
  # class level varaible : intialize it.
  # available to all methods in this class and subclass  
  @@planets_count = 0
    
  def initialize(name)
    # Instance variable - only available one the Obj/Instance is created
    @name = name
	# class level varaible - increment it every time we create a new instance
    @@planets_count += 1
  end
  
  def self.planets_count
    @@planets_count
  end  

  # "Class Level" Instance Variable (exists in the class)
  # this assigns a class level instance Variable
  #  not the "name" above which is a method for the instance method "name"
  class << self; attr_accessor :moons end
  @moons = 2
end

# Subclass of Planet - inheritance
class Moon < Planet
   attr_accessor :diameter, :mass
   def initialize( diam, in_mass )
     @diameter = diam
	 @mass = in_mass
   end
end

Planet.new("earth"); Planet.new("uranus")

puts "planets counted"
puts Planet.planets_count
puts "planets variables : class, instance"
puts Planet.class_variables
puts Planet.instance_variables
puts "Planets - a class level instance variable"
puts Planet.moons

newmoon = Moon.new(9823,9.4*10E6)
puts newmoon.diameter

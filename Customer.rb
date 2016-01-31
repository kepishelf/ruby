

class Customer
   @@no_of_customers = 0
   # cfg the getter, setter methods
   attr_accessor :cust_id, :cust_name, :cust_addr

   # init method 
   def initialize(id, name, addr)
      @cust_id=id
      @cust_name=name
      @cust_addr=addr
      @@no_of_customers += 1		# when init a new instance, incr this class Variable (avail to entire class)
   end

   def self.no_of_customers
	@@no_of_customers
   end
   # other instance vars
	@iv1="hello"	
end


# this person class is a "Subclass" of Customer
class Person < Customer
   @@no_of_customers = 20
   @person_name = name
end

class Jeff
	attr_accessor :p1
	@p1 = 'every'
end

#----------------------------------------------------

list = ['jeff;Letts','warvel']

puts list[0].split(';')

list.each_with_index { |value, index| Customer.new(1, list[index], "") }

cust1 = Customer.new(3,"kelly","letts")
cust2 = Customer.new(4,"izzy","letts")

#p Customer.no_of_customers
puts Customer.no_of_customers
#puts Person.no_of_customers
#puts Customer.no_of_customers

puts "Customer Varaibles. class, then instance"
puts Customer.class_variables
puts Customer.instance_variables

cust3 = Customer.new(5,"olivia", "gettysburg")
puts cust3.iv1

puts "Person Varaibles. class, then instance"
puts Person.class_variables
puts Person.instance_variables

puts "class Jeff"
puts Jeff.instance_variables
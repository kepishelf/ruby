# from Coursera - module2_lesson3_formative.rb
# 
# d:\sandbox\ruby\Example-Class-Variables.rb
class Person
  #have a first_name and last_name attribute with public accessors
  attr_accessor :first_name, :last_name

  #have a class attribute called `people` that holds an array of objects
  @@people = []

  #have an `initialize` method to initialize each instance
  #should take 2 parameters for first_name and last_name
  def initialize(in_fn,in_ln) 
    #assign those parameters to instance variables
    @first_name = in_fn
    @last_name = in_ln
    #add the created instance (self) to people class variable
    # This takes self (the instance / object in this block :  first_name, last_name) 
    # and appends it to the Class Variable "people" - which is an array
    @@people << self
  end

  #have a `search` method to locate all people with a matching `last_name`
  def self.search(last_name)
    #accept a `last_name` parameter
    #search the `people` class attribute for instances with the same `last_name`
    #return a collection of matching instances
    #@@people[-1]
    ## use the .select method on people to select the person.lastname instance var (allow case insensitive searching)
    @@people.select {|person| person.last_name.downcase == last_name.downcase}
  end

  #have a `to_s` method to return a formatted string of the person's name
  def to_s
    #return a formatted string as `first_name(space)last_name`
    return "Person Instance name: #{first_name} #{last_name}"
  end
end

p1 = Person.new("John", "Smith")
p2 = Person.new("John", "Doe")
p3 = Person.new("Jane", "Smith")
p4 = Person.new("Cool", "Dude")

#puts Person.people
puts Person.search("SMITH")

# Should print out
# => John Smith
# => Jane Smith

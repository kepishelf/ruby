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
  attr_reader :output_cnt
  def initialize(in_year, in_addr)
    @members = []        # list of Person objects in the house
    @person_cnt = 0	
    @yearbuilt = in_year
    @addr = in_addr
    # now add all Person objects to array of members
  end  
  
  def create_members( in_person )
    # method to add members to a home and keep a count of members.
	  @members << in_person
	  @person_cnt += 1
  end

  def set_output
    # method to test setting instance var
    @output_cnt = @person_cnt
  end
end


class City
  attr_accessor :name, :state, :home_list, :home_cnt

  def initialize(in_name, in_state )
    @name = in_name
    @state = in_state
    @home_cnt = 0
    @home_list = []
  end

  def add_homes( in_home )
     @home_list << in_home
     @home_cnt += 1
  end
end


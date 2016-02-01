#Implement all parts of this assignment within (this) module2_assignment2.rb file
# \assignment-Calc-Max-Word-Freq\module2_assignment.rb
#
#------------------------------------------------
# Implement a class called LineAnalyzer
#------------------------------------------------
class LineAnalyzer
  #Implement the following read-only attributes in the LineAnalyzer class. 
  #* highest_wf_count - a number with maximum number of occurrences for a single word (calculated)
  #* highest_wf_words - an array of words with the maximum number of occurrences (calculated)
  #* content          - the string analyzed (provided)
  #* line_number      - the line number analyzed (provided)

  attr_reader :highest_wf_count #- a number with maximum number of occurrences for a single word (calculated)
  attr_reader :highest_wf_words #- an array of words with the maximum number of occurrences (calculated)
  attr_reader :content          #- the string analyzed (provided)
  attr_reader :line_number      #- the line number analyzed (provided)

  @@dbg = false

  #Add the following methods in the LineAnalyzer class.
  #* initialize() - taking a line of text (content) and a line number
  #* calculate_word_frequency() - calculates result

  #Implement the initialize() method to:
  #* take in a line of text and line number
  #* initialize the content and line_number attributes
  #* call the calculate_word_frequency() method.\assignment-Calc-Max-Word-Freq\module2_assignment.rb
  def initialize(in_line, in_lineno)      # CONSTRUCTOR 
    @content = in_line
    @line_number = in_lineno
    if (@@dbg == true) 
      puts " DBG: initialize : #{@content}"  
    end
    @highest_wf_words = []
    @highest_wf_count = 0 
    # Calculate the word and counts for "in_line" by calling this method 
    #  which is intenral to class - this will set the Instance Vars that hold the
    #  words and counts
    calculate_word_frequency()
  end

  #Implement the calculate_word_frequency() method to:
  #* calculate the maximum number of times a single word appears within
  #  provided content and store that in the highest_wf_count attribute.
  #* identify the words that were used the maximum number of times and
  #  store that in the highest_wf_words attribute.
  def calculate_word_frequency
    #(in_content)
    # take inbound "content" (a line of words in a string Var) and project out the words with associated counts.
    #  use a "Hash" instance to store these key:value pairs -> word:counts
    in_content = @content
    word_frequency = Hash.new(0) 
    if (@@dbg == true)
      puts " DBG: IN-Class LineAnalyzer - line= #{in_content}"    
      puts " DBG: - Linesize = #{in_content.bytesize}   Is line null= #{in_content.empty?} "
    end
    # do not process empty lines
    if ( in_content.empty? == true)
      #  line #{line_number} is empty " - set the word and counter instance vars to nothing
      @highest_wf_words = ""
      @highest_wf_count = 0
    else
      # line contains words / content - split on words, convert to lowercase and place into Hash 
      in_content.split.each do |word| 
        word_frequency[word.downcase] += 1 
        # puts "counting #{word}, currval = #{word_frequency[word.downcase]}"
      end 
      if (@@dbg == true)
        printf " DBG: hash of line Created  : "; puts word_frequency
      end 
      # extract the word with most counts and that count from the Hash
      # by setting these instance vars
      # - using the Hash method sort_by()  - sort by the word count
      @highest_wf_count = word_frequency.sort_by {|word, cnt| cnt}.last[1]     # sorts hash by word cnt, pull out highest "cnt"
      # this will get any of the word(s) with max count in this line
      ##@highest_wf_words = word_frequency.sort_by {|word, cnt| cnt}.last[0]
      
      # select() all Keys of the hash (key = the word) that have a value (count) = to the max we just computed.
      # Append each of those to "temparray" - then copy that to the Instance var @highest_wf_words ( array of words )
      temparray = []
      wordsel = word_frequency.select() { | key, val | temparray << key if val  == @highest_wf_count}
      # puts j1.each{|j| puts "arj1= #{j}"}
      @highest_wf_words = temparray


      if (@@dbg == true)
        puts " DBG: hash result : Freq Word and Count : #{@highest_wf_words}, #{@highest_wf_count}"
      end 

    end

    # return :  ???
    #return word_frequency
  end


  # end - class LineAnalyzer
end


#------------------------------------------------
#  Implement a class called Solution. 
#------------------------------------------------
class Solution
  @@dbg = false

  # Implement the following read-only attributes in the Solution class.
  #* analyzers - an array of LineAnalyzer objects for each line in the file
  #* highest_count_across_lines - a number with the maximum value for highest_wf_words attribute in the analyzers array.
  #* highest_count_words_across_lines - a filtered array of LineAnalyzer objects with the highest_wf_words attribute 
  #  equal to the highest_count_across_lines determined previously.
  attr_reader :analyzers
  attr_reader :highest_count_across_lines
  attr_reader :highest_count_words_across_lines 

  def initialize  # CONSTRUCTOR 
    @analyzers = []
    @highest_count_across_lines = 0
    @highest_count_words_across_lines = []
  end   

  # Implement the following methods in the Solution class.
  #* analyze_file() - processes 'test.txt' intro an array of LineAnalyzers and stores them in analyzers.
  # Implement the analyze_file() method() to:
  #* Read the 'test.txt' file in lines 
  #* Create an array of LineAnalyzers for each line in the file

  def analyze_file()
    line_number = 0
    in_file = "test.txt"
    begin
      File.foreach( in_file ) do |line|
        # parse each line of the file and Create an instance / object of the 
        # LineAnalyzer class
        line.chomp!          # remove end of line chars - Using the "!" will remove from this instance / object of the input line
        if (@@dbg == true)
          puts "LINE #{line_number} -------------------------------------------------"
          puts "size: #{line.bytesize}"
          #puts "chomp :  #{line.chomp} "
        end
        resa = LineAnalyzer.new(line, line_number)
        # append each Instance of the LineAnalyzer class to the 
        # array "analyzers" - an Instance variable in this class
        analyzers << resa
        #puts "analyzers: #{analyzers[line_number].line_number}"

        # Compute frequent word and it's count for this line the file :
        #  by calling the method : calculate_word_frequency on this object
        #  stores those values to the instance variables in this Object
        #  this is Now done in initialize() method       - per assignemtn requiremetns
        # resa.calculate_word_frequency

#puts "zz : #{analyzers[-1].highest_wf_words}  #{analyzers[-1].highest_wf_count} "

        if (@@dbg == true)
          puts " DBG: LINE: #{line}"
          puts "                                Loadfile: Line:#{line_number}  Count => Word: #{resa.highest_wf_words}  Max: #{resa.highest_wf_count}"
        end
        # -- Other tools for line parsing --
        # puts line.chomp     # remote newline char from end of string
        # words = line.split  # split all words in the line
        # puts " Line: #{line_number}--- split.words- #{words}"
        line_number += 1
      end
    rescue Exception => e
       return "ERROR loading file : #{in_file}  Error: #{e.message}"
    end  

  end

  #* calculate_line_with_highest_frequency() - determines the highest_count_across_lines and 
  #  highest_count_words_across_lines attribute values
  # Implement the calculate_line_with_highest_frequency() method to:
  #* calculate the maximum value for highest_wf_count contained by the LineAnalyzer objects in analyzers array
  #  and stores this result in the highest_count_across_lines attribute.
  def calculate_line_with_highest_frequency()
    #
    #@highest_count_across_lines = 0

    # sort the list of "analyzers" by the highest word count - sort in reverse so we have the word and it's count
    # in the first element of analyzers array
    #  we sort this instance / object by using the "!"
    analyzers.sort! {|x, y| y.highest_wf_count  <=>  x.highest_wf_count  }

    # 2 alternate methods to sort this array into another Instance of array : "a"
    a = @analyzers.sort_by {|obj| obj.highest_wf_count}
    a.sort! {|x, y| y.highest_wf_count  <=> x.highest_wf_count  }

    # print results of "a" sorted
    # a.each do |obj| ; print "--anly:  #{obj.highest_wf_count} , #{obj.highest_wf_words} " ; end; puts ""

    # save highest word count of all lines
    @highest_count_across_lines = analyzers[0].highest_wf_count

    if (@@dbg == true)
      puts " DBG: Result highest Count,Word : #{analyzers[0].highest_wf_count} , #{analyzers[0].highest_wf_words} "
    end


    #* identifies the LineAnalyzer objects in the analyzers array that have highest_wf_count equal to highest_count_across_lines 
    #  attribute value determined previously and stores them in highest_count_words_across_lines.
    #- Use "select" method on array to find the high word count lines that match the Max we just computed
    filter_arr = analyzers.select() { |wordcnt| wordcnt.highest_wf_count == highest_count_across_lines }

    filter_arr.each do |obj| 
      highest_count_words_across_lines << obj
      if (@@dbg == true)
        puts "== filter DBG: Words=#{obj.highest_wf_words}    Count=#{obj.highest_wf_count}   Line=#{obj.line_number}" 
      end  
    end
  
puts "-----debugging highcnt = #{@highest_count_across_lines}"

    # This method returns the hight word count across all lines
    return @highest_count_across_lines
  end


  #Implement the print_highest_word_frequency_across_lines() method to
  #* print the values of objects in highest_count_words_across_lines in the specified format
  #* print_highest_word_frequency_across_lines() - prints the values of LineAnalyzer objects in 
  #  highest_count_words_across_lines in the specified format
  def print_highest_word_frequency_across_lines()
    # array 'analyzers' was sorted in method : calculate_line_with_highest_frequency()
    @highest_count_words_across_lines.each do |obj| 
      puts " Line=#{obj.line_number}  Count=#{obj.highest_wf_count}  Word=#{obj.highest_wf_words}    " 
    end  
    #
  end

      # end of class Solution
end





#------------------------------------------------
puts "--- Test Outside Class word counting"
  #res = LineAnalyzer.new("jeff warvel was here mr. warvel",2)
  # calculate max word and frequeny 
  #res.calculate_word_frequency
  #puts "Count max #{res.highest_wf_count}"
  

#------------------------------------------------
#------------------------------------------------

# Create an instance of the Solution object - initialize all instance vars.
sol = Solution.new
filename = "test.txt"
puts "- Begin : Parsing file : #{filename} "

# now parse the file specified, counting the max words in each line
sol.analyze_file()

#- debugging : 
# testline = 2
# print "Max word count of line #{testline} : "
# puts sol.analyzers[testline].highest_wf_count
#- Solution class instance vars - 
# puts "Solution class instance vars - "; puts sol.instance_variables

#- debugging : 
#-  print all all line max word count
#-  Ex:  arr1.each { |value| print " next #{value} " }
# sol.analyzers.each_with_index { |value, i| puts "#{i}- #{value.highest_wf_count}   #{value.highest_wf_words}" }

# call method to find highest word count
sol.calculate_line_with_highest_frequency
puts "Highest Count for all lines: #{sol.highest_count_across_lines}"

puts "highest_count_words_across_lines"
#puts sol.highest_count_words_across_lines[0].highest_wf_words
puts sol.highest_count_words_across_lines.map(&:highest_wf_words)

puts "!!!!!!!!!!!!  FINAL RESULTS !!!!!!!!!!!!!!!!"
puts "- Sorted Array of LineAnalyzer objects - "
sol.print_highest_word_frequency_across_lines()

#sol.highest_count_words_across_lines.each { |obj| puts obj.highest_wf_words}
# puts sol.highest_count_words_across_lines.map(&:highest_wf_words).flatten

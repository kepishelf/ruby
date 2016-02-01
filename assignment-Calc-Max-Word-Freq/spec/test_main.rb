# main class to test assignemnt

require_relative "../module2_assignment"



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

class WatcherConfig
  attr_reader :log_file 		  	# getter only 
  attr_accessor :config_file 		# creates getter, setter for x

  def initialize (log_file, config_fileVar)  # CONSTRUCTOR 
    # setup instance variables 
    @log_file = log_file
    self.config_file = config_fileVar 		# call self.xx  method . "self" is required here. (when inside the method)
    puts "Assigning configuration file: #{config_file}"
  end 
  def config_file= (new_config_file) 
  	@config_file ||="watchConfig.txt"				# default, only set when initialied and not passed in
    @config_file = new_config_file  # unless ( new_age > 120  or new_age < 0 )
  end 
  def load_config (config_fileVar)
    if File.exist? config_fileVar
      puts "loading config: #{config_fileVar}"
      begin
        File.foreach( config_fileVar ) do |line|
#          puts " cfg: --------- #{line}"
          case line
            when line[0] = "#"     # comment line
          end
          #puts line.chomp    # remote newline char from end of string
          arr = line.split
          #puts arr
        end
      end
      return true
    else
      return false
    end
  end

end 


#config_file
configFilename = "watcher.cfg"
puts "Starting Watcher with config: #{configFilename}"
# create a new Object, Instance of the watcher configuration
watcher1 = WatcherConfig.new("", configFilename)
puts watcher1.config_file
#puts watcher1.log_file

#=>
p watcher1.load_config(watcher1.config_file)
puts "=============="
if watcher1.load_config(watcher1.config_file)
   puts "loaded"
else
   puts "missing config"
end

# load config with YAML
puts "YAML------------------------------------"
require 'yaml'
config = YAML::load_file(configFilename)
puts config["logoptions"]


open('watcher.cfg') { |f| puts f.read }


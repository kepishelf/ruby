	require 'yaml'
	configuration = { 'color' => 'blue',
	                  'font' => 'Septimus',
	                  'font-size' => 7 }
#	open('text.cfg', 'w') { |f| YAML.dump(configuration, f) }

#	open('text.cfg') { |f| puts f.read }
	# --
	# font-size: 7
	# color: blue
	# font: Septimus

	open('text.cfg') { |f| YAML.load(f) }
	f = 'text.cfg'
	cfg = YAML::load_file(f)

	#puts " config #{cfg}"

	cfg.each_pair do | key, value|
  		puts "Key: #{key} = #{value}"
	end

	
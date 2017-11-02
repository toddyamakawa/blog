#!/usr/bin/env ruby
require 'yaml'

class Fixnum
	def to_cfg(parent = '')
		return ["#{parent}=#{self.to_s}"]
	end
end

class String
	def to_cfg(parent = '')
		return ["#{parent}='#{self}'"]
	end
end

class Array
	def to_cfg(parent = '')
		config = Array.new
		self.each_with_index do |item, index|
			config << [item.to_cfg("#{parent}[#{index}]")]
		end
		return config
	end
end

class Hash
	def to_cfg(parent = '')
		config = Array.new
		parent = "#{parent}." unless parent.empty?

		self.keys.sort.each do |key|
			config << self[key].to_cfg("#{parent}#{key}")
		end

		return config
	end
end


if __FILE__ == $0
	file = ARGV[0]

	if file.nil?
		p "Usage: #{$0} <filename.json>"
		exit
	end

	unless File.file? file
		p "File '#{file}' doesn't exist"
		exit 1
	end

	out = "#{File.dirname(file)}/#{File.basename(file, File.extname(file))}.cfg"

	hash = YAML.load(File.read(file))
	File.write(out, hash.to_cfg.flatten.join("\n"))
end


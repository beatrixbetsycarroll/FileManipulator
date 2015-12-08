class MyFile < ActiveRecord::Base

	def initialize(filename)
		@filename = filename
		@file_path = "./public/#{filename}"
	end

	def self.get_contents_of_file(filename)
		contents=""
		File.open("./public/#{filename}", 'rb') do |f|
			contents = f.read
		end
		contents
	end

	def self.get_total_word_count(filename)
		contents=self.get_contents_of_file(filename)
		contents.length
	end
end

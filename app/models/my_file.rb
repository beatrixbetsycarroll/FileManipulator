class MyFile < ActiveRecord::Base
	validates :filename, presence: true, uniqueness: true

	attr_accessor :contents, :word_count, :word_frequency_hash

	def get_contents_of_file
		@contents=""
		File.open("./public/#{self.filename}", 'rb') do |f|
			@contents = f.read
		end
		@contents
	end

	def get_total_word_count
		@word_count = @contents.split(" ").size
		# @contents.scan(/[\w']+/)
	end

	def get_word_frequency_hash
		word_array = @contents.scan(/[\w']+/)
		word_hash = Hash.new
		word_array.each do |word|
			word = word.downcase
			if word_hash[word].nil?
				word_hash[word] = 0
			else
				word_hash[word] += 1
			end
		end
		@word_frequency_hash = word_hash
	end

	def get_all_word_data
		self.get_contents_of_file
		self.get_total_word_count
		self.get_word_frequency_hash
	end

	def to_json
        {'word_count' => @word_count, 'word_frequency_hash' => @word_frequency_hash}.to_json
    end

    # def self.from_json(string)
    #     data = JSON.load(string)
    #     new_file = self.new
    #     new_file.word_count = data['word_count']
    #     new_file.word_frequency_hash = data['word_frequency_hash']
    # end
end
get '/' do
	@my_files = MyFile.all

	erb :index
end

get '/search' do
	@my_files = MyFile.all
	
	erb :search
end


post '/search'  do
	@all_files = MyFile.all
	@results = []
	@searched_for = params[:query].downcase
	@all_files.each do |file|
   		file.get_all_word_data
   		@results.push(file) if file.contents.downcase.include?(@searched_for)   		
   	end

	@results

	erb :results
end
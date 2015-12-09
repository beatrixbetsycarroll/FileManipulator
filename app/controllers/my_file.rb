get '/my_file/new' do
	erb :'my_file/new'
end


post '/my_file' do
	@filename = params[:file][:filename]
	file = params[:file][:tempfile]

	File.open("./public/#{@filename}", 'wb') do |f|
		f.write(file.read)
	end

	@my_file = MyFile.new
	@my_file.filename = @filename
	@my_file.file_path = "./public/#{@filename}"
	@my_file.save

	if @my_file.save
      redirect("/my_file/#{@my_file.id}")
    else
      session[:errors] = @my_file.errors.messages
      redirect("/")
    end

end


get '/my_file/:id.json' do
    @my_file = MyFile.find(params[:id])
    @my_file.get_all_word_data

    @my_file.to_json
end


get '/my_file/:id' do
    @my_file = MyFile.find(params[:id])
    @my_file.get_all_word_data

    erb :'/my_file/show'
end

get '/my_file/:id/delete' do
	@my_file = MyFile.find(params[:id])
	erb :'/my_file/delete'
end

delete '/my_file/:id' do
	@my_file = MyFile.find(params[:id])
	@my_file.destroy
	redirect('/')
end
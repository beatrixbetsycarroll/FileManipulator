get '/my_file/new' do
	erb :form
end

post '/my_file' do
  
	@filename = params[:file][:filename]
	file = params[:file][:tempfile]

	File.open("./public/#{@filename}", 'wb') do |f|
		f.write(file.read)
	end

	puts "**** file name"
	puts @filename
	puts params[:file][:filename]

	@my_file = MyFile.new(params[:filename])
	erb :show_file
end

delete '/my_file/:id/deactivate' do |id|
  @my_file = MyFile.find(id)
  @my_file.destroy
  redirect('/')
end
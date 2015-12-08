get '/' do
  # Look in app/views/index.erb

  @my_files = MyFile.all

  erb :index
end


get '/' do

  @my_files = MyFile.all

  erb :index
end


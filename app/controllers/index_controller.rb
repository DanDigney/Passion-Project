get '/' do
  @bills = Bill.all
  erb :test
end

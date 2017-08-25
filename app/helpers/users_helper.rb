def acceptable_password?
  params[:user][:password].length >= 3
end

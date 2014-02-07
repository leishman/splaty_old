use Rack::Flash

get '/' do
  erb :index
end

#-------Signup------

post '/users' do
  user = User.new(params[:user])
  if user.valid?
    user.save
    redirect "/#{user.username}"
  else
    flash[:errors] = user.errors.messages
    redirect '/'
  end
end

#----User pages---

get '/:username' do
  @user = User.find_by_username(params[:username])
  erb :user_page
end

# post '/:username' do

# end



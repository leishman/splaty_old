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
  begin
    @user = User.find_by_username(params[:username])
    erb :user_page
  rescue
    redirect '/'
  end
end

post '/:username' do
  user = User.find_by_username(params[:username])
  begin
    user.collection.update_attributes(params[:data])
  rescue
    collection = Collection.create(params[:data])
    user.collection = collection
  end
end
use Rack::Flash

# before do
#   if request.request_method == "POST"
#     user = User.find_by_username(params[:username])
#   end
# end

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

post '/:username/notes' do
  user = User.find_by_username(params[:username])
  begin
    user.notes.first.update_attributes(params[:data])
  rescue
    note = Note.create(params[:data])
    user.notes << note
  end
end

post '/:username/photos' do
  p params
  user = User.find_by_username(params[:username])
  p = Photo.new
  p.image = params[:image]
  p.save
  user.photos << p

  # p.description = params[:description]
  redirect "/params[:username]"
end
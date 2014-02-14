helpers do
  def user_exists?
    @user = User.find_by_username(params[:username])
    !@user.nil?
  end

  def get_user_content
    @note = @user.notes.first.try(:text).try(:strip)
  end
end
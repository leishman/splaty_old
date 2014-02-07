describe 'User, an Active Record-backed model' do
  before(:each) do
    @user = User.new({username: "leishman"})
  end

  it "should have a username" do
    expect(@user.username).to exist
  end

  it "should not allow duplicate usernames" do
    @user2 = User.new({username: "leishman"})
    expect(@user2.valid?).to be_false
  end

  it "should not allow empty usernames" do
    @user2 = User.new({username: ""})
    expect(@user2.valid?).to  be_false
  end
end
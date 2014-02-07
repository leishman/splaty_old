require_relative 'spec_helper'

describe 'User, an Active Record-backed model' do
  before(:each) do
    User.delete_all
  end

  it "should have a username" do
    @user = User.new({username: "leishman", email: "leishman3@gmail"})
    expect(@user.username).to eq "leishman"
  end

  it "should not allow duplicate usernames" do
    @user = User.create({username: "leishman", email: "leishman3@gmail.com"})
    @user2 = User.new({username: "leishman", email: "leishman4@gmail.com"})
    expect(@user2.valid?).to be_false
    expect(@user.valid?).to be_true
  end

  it "should not allow empty usernames" do
    @user2 = User.new({username: "", email: "leishman3@gmail.com"})
    expect(@user2.valid?).to be_false
  end

  it "should not allow empty emails" do
    @user2 = User.new({username: ""})
  end

  it "should not allow duplicate emails" do
    @user = User.create({username: "leishman", email: "leishman3@gmail.com"})
    @user2 = User.new({username: "bob", email: "leishman3@gmail.com"})
    expect(@user2.valid?).to be_false
  end

  it "should not allow incorrectly formatted emails" do
    @user = User.new({username: "leishman", email: "leishman3gmail.com"})
    expect(@user.valid?).to be_false
    @user = User.new({username: "leishman", email: "leishman3@gmail"})
    expect(@user.valid?).to be_false
    @user = User.new({username: "leishman", email: "@gmail.com"})
    expect(@user.valid?).to be_false
    @user = User.new({username: "leishman", email: "gmail"})
    expect(@user.valid?).to be_false
    @user = User.new({username: "leishman", email: "leishman @gmail.com"})
    expect(@user.valid?).to be_false
    @user = User.new({username: "leishman", email: " leishman3@gmail.com"})
    expect(@user.valid?).to be_false
  end
end
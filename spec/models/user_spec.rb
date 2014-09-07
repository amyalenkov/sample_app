require 'spec_helper'

describe User do
  before{ @user = User.new( name: "exm user", email: "exm@email.com")}

  subject(@user)

  it{should respond_to(:name)}
  it{should respond_to(:email)}

  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
    end
  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "name is too long" do
    before { @user.name = "a"*51 }
    it{should_not be_valid}
    end

  describe "email format is valid" do
    it "should be valid email format" do
      emails = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      emails.each do |email|
        @user.email = email
        expect(@user).to be_valid
      end
    end
    end

  describe "email format is invalid" do
    it "should be invalid email format" do
      emails = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      emails.each do |email|
        @user.email = email
        expect(@user).not_to be_valid
      end
    end
  end
end

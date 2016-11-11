# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do
  before {@user = User.new(name:"me", email:"you@gmail.com", password:"123456789",password_confirmation:"123456789")}

  subject {@user}

  it {should respond_to(:name)}
  it {should respond_to(:email)}
  it {should respond_to(:password)}
  it {should respond_to(:password_confirmation)}

  it {should be_valid}

  describe "when name is not present" do
    before{@user.name=""}
      it {should_not  be_valid}
  end
  describe "when email is not present" do
    before {@user.email=""}
    it {should_not  be_valid}
  end

  describe "when email is not valid" do
    before {@user.email="abc.ksbsddk@djdjd"}
    it {should_not be_valid}
  end

  describe "when email is valid" do
    before {@user.email="abc.jhsk@gmshd.com"}

    it {should be_valid}
  end

  describe "when email id is duplicate" do
    before {
      new_user = @user.dup
      new_user.email = new_user.email.upcase
      new_user.save
    }
    it {should_not be_valid}
  end

  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = ""}
    it {should_not be_valid}
  end

  describe "when password confirmation does not match" do
    before { @user.password_confirmation = "mismatch"}
    it {should_not be_valid}
  end

  describe "when password confirmation is nill" do
    before { @user.password_confirmation = nil}
    it {should_not be_valid}
  end

  describe "return value of authenticate method" do
    before {@user.save}

    let(:found_user) {User.find_by_email(@user.email)}
    describe "with valid password" do
      it {should == found_user.authenticate(@user.password)}
    end

    describe "with invalid password" do
      let(:invalid_password) {found_user.authenticate("invalid")}
      it {should_not == invalid_password}
      specify "should be false" do
        invalid_password.should be_false
      end
    end
  end


end


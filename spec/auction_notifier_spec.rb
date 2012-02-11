require 'spec_helper'

describe 'Auction Notifier App' do
  it "should respond to GET" do
    get '/'
    last_response.should be_ok
  end

  describe 'users' do    
    before { @user = User.new(email: "email@example.com") }
    subject { @user }

    it { should respond_to(:email) }

    it { should be_valid }

    describe "when email is not present" do
      before { @user.email = " " }
      it { should_not be_valid }
    end

    describe "when email is invalid" do
      addresses =  %w{email@example,com email@example email_at_example.com @example.com}
      addresses.each do |address|
        before { @user.email = address }
        it { should_not be_valid }
      end
    end

    describe "when email is taken" do
      before do 
        same_user = User.new(email: "email@example.com")
        same_user.save
      end

      it { should_not be_valid }
    end
  end
end

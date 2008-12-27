require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe User do

  it "should be unactive after creating" do
   user = create_user
   user.active.should == false
  end

  it "should not save without passing validation" do
    create_user( :password => "sla", :password_confirmation => "sla" ).should == false
    create_user( :login => "").should == false
    create_user( :login => "dd").should == false
  end

  it "should not create user if password and password_confirmation are not same" do
    create_user( :password => "slawosz2").should == false
  end

end

def create_user( user_data = { :login => "slawosz", :password => "slawosz", :password_confirmation => "slawosz", :email => "slawosz@gmail.com" }, options = {} )
  user_data.merge!(options)
  user = User.new(user_data)
  user.save ? user : false
end

# This is a default user class used to activate merb-auth.  Feel free to change from a User to 
# Some other class, or to remove it altogether.  If removed, merb-auth may not work by default.
#
# Don't forget that by default the salted_user mixin is used from merb-more
# You'll need to setup your db as per the salted_user mixin, and you'll need
# To use :password, and :password_confirmation when creating a user
#
# see merb/merb-auth/setup.rb to see how to disable the salted_user mixin
# 
# You will need to setup your database and create a user.
class User
  include DataMapper::Resource
  include Merb::Authentication::Mixins::ActivatedUser

  
  property :id,                            Serial
  property :login,                         String
  property :login,                         String, :nullable => false, :unique => true, :index => true #, :format => /^[\w_\.-]{3,20}$/
  property :email,                         String, :nullable => false, :unique => true, :format => :email_address
  property :admin,                         Boolean, :nullable => false, :default => false
  property :created_at,                    DateTime
 #property :password_reset_token,          String
  property :remember_me_token_expiration,  DateTime
  property :remember_me_token,             String
  
  validates_length :login, :min => 3
  validates_length :password, :min => 4, :if => :password_required?

  #def validate_password? ; new_record? || !password.blank?

  def is_admin?
    self.admin
  end

end

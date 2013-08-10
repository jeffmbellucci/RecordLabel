class User < ActiveRecord::Base
  attr_accessible :email, :password, :session_token
end

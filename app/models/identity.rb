class Identity < OmniAuth::Identity::Models::ActiveRecord
 has_secure_password
 validates_presence_of :password, :on => :create
 validates_presence_of :email
 validates_uniqueness_of :email

end
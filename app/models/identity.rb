class Identity < OmniAuth::Identity::Models::ActiveRecord
 has_secure_password
 validates_presence_of :password, :on => :create
end
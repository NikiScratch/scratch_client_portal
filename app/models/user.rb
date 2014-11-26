class User < ActiveRecord::Base
has_many :events_users, dependent: :destroy
has_many :events, through: :events_users
has_many :venues, through: :events
#has_many :events_venues, through: :events

  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
  end
    
  end
end
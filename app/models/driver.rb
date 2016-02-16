class Driver < ActiveRecord::Base
  devise :database_authenticatable, authentication_keys: [:phone]
end

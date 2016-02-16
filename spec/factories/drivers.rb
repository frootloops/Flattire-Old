FactoryGirl.define do
  factory :driver do
    name "Arsen Gasparyan"
    email "to.arsen.gasparyan@gmail.com"
    phone "+79999808630"
    authentication_token { SecureRandom.uuid }
  end
end

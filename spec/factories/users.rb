FactoryGirl.define do
  factory :user do
    first_name "firstname"
    last_name "lastname"
    email "fakeuser@userapp.com"
    password "supersecret"
    role 0
    phone_number "7773339999"
  end

end
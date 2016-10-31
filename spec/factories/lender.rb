FactoryGirl.define do
  factory :lender, class: User do
    name "bob"
    password "password"
    email "bob@bob.com"
    location "123 Fake St."
  end
end

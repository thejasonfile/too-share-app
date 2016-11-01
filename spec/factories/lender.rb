FactoryGirl.define do
  factory :lender, class: User do
    name "bob"
    password "password"
    email "bob@bob.com"
    location "123 Fake St."
    zip_code "88032"
  end
end

FactoryGirl.define do
  factory :borrower, class: User do
    name "amy"
    password "youwish"
    email "amy@gmail.com"
    location "Stuck in a painting"
    zip_code "77059"
  end
end

FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    email "jdoe@gmail.com"
    birthday "1986-07-11 00:00:00.000000"
    password 'foobar123'
    password_confirmation 'foobar123'

  end
end

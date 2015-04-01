FactoryGirl.define do

  factory :user do
    email('user@email.com')
    username('doge')
    handle('SuperDoge')
    password('12345678')
    password_confirmation('12345678')
  end

end

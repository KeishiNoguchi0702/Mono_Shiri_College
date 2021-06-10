FactoryBot.define do

  factory :user do
    certificate_number      { Faker::Number.number(digits: 6) }
    email                   { Faker::Internet.email }
    password                { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation   { password }
    last_name               { '保家' }
    first_name              { '太郎' }
    last_name_kana          { 'ホゲ' }
    first_name_kana         { 'タロウ' }
    department_id           { 1 }
    sex_id                  { 1 }
    position_id             { 1 }
    profile                 { Faker::Lorem.word }

    after(:build) do |user|
      user.image.attach(io: File.open('app/assets/spectest/ok.png'), filename: 'ok.png')
    end

  end
end

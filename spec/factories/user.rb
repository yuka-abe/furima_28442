FactoryBot.define do
  factory :user do
    nickname              { 'yamada' }
    email                 { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { 'ぜんかく' }
    last_name             { 'ぜんかく' }
    first_name_kana            { 'ゼンカク' }
    last_name_kana             { 'ゼンカク' }
    birthday { '2020-01-01' }
  end
end

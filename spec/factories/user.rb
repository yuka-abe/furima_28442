require 'rails_helper'

FactoryBot.define do
 
  factory :user do
    nickname              { "yamada" }
    email                 { Faker::Internet.email }
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name            { "ぜんかく" }
    last_name             { "ぜんかく" }
    first_name_kana            { "ゼンカクカナ" }
    last_name_kana             { "ゼンカクカナ" }
    birthday { "2020-01-01" }
  end
end
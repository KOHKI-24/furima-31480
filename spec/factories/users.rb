FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'テスト'}
    family_name           {'テスト'}
    first_name_kana       {'テスト'}
    family_name_kana      {'テスト'}
    birth_day             {'2000-01-01'}
  end
end
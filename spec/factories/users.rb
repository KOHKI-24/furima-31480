FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    first_name            {'テスト'}
    family_name           {'テスト'}
    first_name_kana       {'テスト'}
    family_name_kana      {'テスト'}
    birth_day             {'1'}
  end
end
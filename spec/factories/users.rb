FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"aa00000000"}
    password_confirmation { password }
    l_name                {"山田"}
    f_name                {"太郎"}
    l_name_kana           {"ヤマダ"}
    f_name_kana           {"タロウ"}
    birthday              {"19300109"}
  end
end 
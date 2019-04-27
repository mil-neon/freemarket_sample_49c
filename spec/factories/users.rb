FactoryBot.define do
  factory :user do
    nickname { "大魔神" }
    email { "kkk@gmail.com" }
    firstname_fullangle { "炎山" }
    lastname_fullangle { "我修院" }
    birthday { "2020-01-01" }
    firstname_kana { "エンザン" }
    lastname_kana { "ガシュウイン" }
    postal_cord { "666" }
    prefecture { "カントー" }
    city { "マサラタウン" }
    address_number { "0000" }
    phone_number { "00000" }
    password { "0000000" }
  end
end

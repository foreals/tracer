FactoryBot.define do
  factory :close_contact do
    name { "MyString" }
    association :user
  end

  factory :testform do
    date { "1/1/2020" }
    RESULT { "P" }
    association :user
  end


    factory :user do
        sequence(:cellphone)
        first_name { "Rodney" }
        last_name { "Doe" }
        email { "jd1@evansville.edu" }
        sequence(:username) { |n| "The_Doctor#{n}" }
        password {"software_engineering"}
        admin {false}
    end

    factory :admin_user, parent: :user do
      admin {true}
    end 

end

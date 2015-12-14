FactoryGirl.define do 
  factory :event do 
    name 					{"A Presentation on #{Faker::Commerce.department(3)}"}
    description 	{Faker::Lorem.paragraph(1,true)}
    date 					{Faker::Date.forward(15)}
    user					{FactoryGirl.create(:user)}
  end
end

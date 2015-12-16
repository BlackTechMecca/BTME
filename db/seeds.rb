# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
15.times do
  FactoryGirl.create(:job_post)
end

15.times do
  FactoryGirl.create(:event)
end

test_user = FactoryGirl.build(:user, :email => "chrissie@gmail.com", :password => "password", :password_confirmation => "password")

test_user.skip_confirmation!
test_user.save













FactoryGirl.define do
  factory :task do
    bill_time 1.5
    bill_rate 175
    description "This is the project task I did for you."
    billed false
    date 07-24-2014
    project
  end
end

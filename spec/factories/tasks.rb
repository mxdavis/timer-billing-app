FactoryGirl.define do
  factory :task do
    bill_time 1.5
    bill_rate 175
    description "This is the project task I did for you."
    billed false
    date "2014-7-24"
    project
  end
end

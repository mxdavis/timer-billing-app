FactoryGirl.define do
  factory :task do
    project 1
    bill_time 1.5
    bill_rate 175
    description "This is the project task I did for you."
    billed false
  end
end

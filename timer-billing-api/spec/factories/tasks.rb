FactoryGirl.define do
  factory :task do
    project nil
    bill_time 1.5
    bill_rate 1.5
    description "MyText"
    billed false
  end
end

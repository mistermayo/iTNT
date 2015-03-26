FactoryGirl.define do
  factory :spot do
    header("Rad Pad")
    description("Abodest with with mostest")
    availability("24/7/364 - I don't work on my birthday")
    location("Portland, OR")
    photo('/Users/Guest/Desktop/iTNT/spec/features/home-cat.jpg')
    price(40)
    details("You will be surrounded by wicked awesome folks, doing cool stuff, all day long")
  end

end

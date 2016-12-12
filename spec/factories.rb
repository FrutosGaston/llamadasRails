FactoryGirl.define do
  factory :call, class: Call do
    origin Location.new({pais: 'US', ciudad: 'NY'})
    destination Location.new({pais: 'US', ciudad: 'Miami'})
    last 2
    when_was DateTime.new(2016,11,30,11,1,1,'+0')
  end
end
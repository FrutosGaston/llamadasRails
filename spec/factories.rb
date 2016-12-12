FactoryGirl.define do
  factory :call, class: Call do
    origin Location.new({pais: ISO3166::Country.new('US'), ciudad: 'NY'})
    destination Location.new({pais: ISO3166::Country.new('US'), ciudad: 'Miami'})
    last 5
    when_was DateTime.new(2016,11,30,11,1,1,'+7')
  end
end
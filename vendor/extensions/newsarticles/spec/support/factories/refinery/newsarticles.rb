
FactoryGirl.define do
  factory :newsarticle, :class => Refinery::Newsarticles::Newsarticle do
    sequence(:headline) { |n| "refinery#{n}" }
  end
end


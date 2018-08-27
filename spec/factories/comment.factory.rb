FactoryBot.define do
  factory :comment, class: Comment do
    body "Example Comment"
    rating [1, 2, 3, 4, 5].sample
    product
    user
  end
end
FactoryBot.define do

  factory :post do
    title { Faker::Movies::HarryPotter.location }
    content { Faker::Movies::HarryPotter.quote }
    published { 
      r = rand(0..1)
      r == 0 ? false: true
    }
    user
  end

  factory :published_post, class: 'Post' do
    title { Faker::Movies::HarryPotter.location }
    content { Faker::Movies::HarryPotter.quote }
    published { true }
    user
  end

end

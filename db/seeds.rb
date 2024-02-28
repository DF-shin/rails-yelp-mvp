require 'faker'
cat = %w[chinese italian japanese french belgian]
rate = (0..5).to_a
Restaurant.destroy_all

5.times do
  restaurant = Restaurant.create!(
    name: Faker::Food.ethnic_category,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: cat.sample
  )
  5.times do
    review = Review.new(
      rating: rate.sample,
      content: Faker::Quote.famous_last_words
    )
    review.restaurant = restaurant
    review.save!
  end
end

puts 'Creating restaurants! With Reviews!'

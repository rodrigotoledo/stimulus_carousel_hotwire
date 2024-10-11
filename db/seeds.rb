
Card.destroy_all

image_paths = Dir[Rails.root.join('lib', '*.png')]

10.times do
  Card.create!(
    description: Faker::Lorem.sentence(word_count: 10),
    likes: rand(0..100),
    image: File.open(image_paths.sample)
  )
end

puts "Created #{Card.count} cards with random images and descriptions."

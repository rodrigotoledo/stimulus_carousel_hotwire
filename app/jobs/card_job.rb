class CardJob < ApplicationJob
  queue_as :default

  def perform(id)
    card = Card.find(id)
    card.description = Faker::Lorem.sentence
    card.likes += 1
    rand(1..10).times do
      card.comments.build(content: Faker::Lorem.sentence)
    end
    card.save
  end
end

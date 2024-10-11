namespace :card do
  desc "Increment likes"
  task increment_likes: :environment do
    card = Card.find(ENV["id"])
    card.description = Faker::Lorem.sentence
    card.likes += 1
    if card.save
      puts "Likes incremented."
    else
      puts "Failed to increment likes"
    end
  end

  desc "Increment comments"
  task increment_comments: :environment do
    comment = Comment.new(card_id: ENV["id"], content: Faker::Lorem.sentence)

    if comment.save
      puts "Comments incremented"
    else
      puts "Failed to increment comments."
    end
  end
end

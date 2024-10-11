class Comment < ApplicationRecord
  belongs_to :card
  after_create_commit :broadcast_comment_count

  private

  def broadcast_comment_count
    card.broadcast_update_to(
      "card",
      target: "card_comments_#{card.id}",
      html: card.comments.count
    )
  end
end

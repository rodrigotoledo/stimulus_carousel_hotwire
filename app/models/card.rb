class Card < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_one_attached :image

  # Validações
  validates :description, presence: true
  validates :likes, numericality: { greater_than_or_equal_to: 0 }


  after_update_commit :broadcast_likes, :broadcast_card

  def processed_image
    return unless image.attached?
    image.variant(resize_to_limit: [ 800, 800 ]).processed
  end

  private
  def broadcast_likes
    return unless saved_change_to_likes?
    broadcast_update_to("card", target: "card_likes_#{id}", html: likes)
  end

  def broadcast_card
    return unless saved_change_to_description?
    broadcast_update_to("card", target: "card_#{id}", partial: "home/card", locals: { card: self })
  end
end

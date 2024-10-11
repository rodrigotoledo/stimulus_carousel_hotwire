class HomeController < ApplicationController
  def index
  end
  def random

    @card = Card.find(params[:id]) if params[:id].present?
    @card ||= Card.order("RANDOM()").first
    @cards = Card.all
  end
end

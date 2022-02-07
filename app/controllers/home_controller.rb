class HomeController < ApplicationController
  def index
    @categories = Category.includes(:questions).where.not(questions: { category_id: nil })
  end

  def contact
    @contact = Contact.new
  end

  # def autocomplete
  #   @search_results = ['apple', 'apple juice', 'apple pie', 'banana', 'custard apple', 'banana snack', 'orange', 'mango']
  #   render layout: false
  # end
end
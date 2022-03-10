class HomeController < ApplicationController

  # layout 'home'
  
  def index
    @categories = Category.includes(:questions).where.not(questions: { category_id: nil }).where(questions: { publish: true })
  end

  def contact
    redirect_to new_contact_path
  end

end
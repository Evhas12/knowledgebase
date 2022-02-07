# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  slug       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  has_many :questions, dependent: :destroy

  validates_presence_of :title, :slug
  validates_uniqueness_of :slug, :title

  paginates_per 10

  extend FriendlyId
  friendly_id :title, use: :slugged
end

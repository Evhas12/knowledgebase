# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  topic       :string
#  slug        :string
#  category_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#  publish     :boolean
#

class Question < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_rich_text :answer

  validates_presence_of :topic, :slug, :answer
  validates_uniqueness_of :slug, :topic

  paginates_per 10

  extend FriendlyId
  friendly_id :topic, use: :slugged
  
  # scope :filter_by_topic, -> (query) { joins(:rich_text_answer).merge(ActionText::RichText.where('lower(topic) LIKE ?', "%#{topic.downcase}%")) }

  scope :filter_by_query, ->(query) { joins(:rich_text_answer).merge(ActionText::RichText.where <<~SQL, "%" + query.downcase + "%") }
    lower(body) LIKE ?
  SQL
end

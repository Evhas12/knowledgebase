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

require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

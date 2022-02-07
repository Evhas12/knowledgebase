# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  topic       :string(255)
#  slug        :string(255)
#  category_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#

require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

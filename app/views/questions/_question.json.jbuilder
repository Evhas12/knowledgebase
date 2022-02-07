json.extract! question, :id, :topic, :slug, :category_id, :answer, :created_at, :updated_at
json.url question_url(question, format: :json)
json.answer question.answer.to_s

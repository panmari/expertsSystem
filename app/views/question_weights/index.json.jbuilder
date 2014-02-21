json.array!(@question_weights) do |question_weight|
  json.extract! question_weight, :id, :expert_id, :question_id, :weight
  json.url question_weight_url(question_weight, format: :json)
end

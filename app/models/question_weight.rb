class QuestionWeight < ActiveRecord::Base
  belongs_to :expert
  belongs_to :question
end

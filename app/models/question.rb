class Question < ActiveRecord::Base
  has_many :question_weights
  has_many :experts, :through => :question_weights
end

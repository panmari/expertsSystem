class Expert < ActiveRecord::Base
  has_many :question_weights
  has_many :questions, :through => :question_weights
end

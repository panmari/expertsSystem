class Question < ActiveRecord::Base
  has_many :question_weights, :dependent => :destroy
  has_many :experts, :through => :question_weights
end

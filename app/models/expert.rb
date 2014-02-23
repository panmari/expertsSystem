class Expert < ActiveRecord::Base
  has_many :question_weights
  has_many :questions, :through => :question_weights
  accepts_nested_attributes_for :questions, :allow_destroy => true,
                                :reject_if => :all_blank
end

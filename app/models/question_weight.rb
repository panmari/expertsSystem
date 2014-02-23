class QuestionWeight < ActiveRecord::Base
  belongs_to :expert
  belongs_to :question

  after_initialize :default_values

  # Sets default weight to 10
  def default_values
    self.weight ||= 10.0
  end
end

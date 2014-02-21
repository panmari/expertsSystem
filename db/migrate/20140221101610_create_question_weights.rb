class CreateQuestionWeights < ActiveRecord::Migration
  def change
    create_table :question_weights do |t|
      t.integer :expert_id
      t.integer :question_id
      t.float :weight

      t.timestamps
    end
  end
end

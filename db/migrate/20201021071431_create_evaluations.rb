class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.references :entry, foreign_key: true
      t.float :compreh
      t.float :constitution
      t.float :directing
      t.float :drawing
      t.float :music

      t.timestamps
    end
  end
end

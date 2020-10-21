class CreateEntryImages < ActiveRecord::Migration[5.2]
  def change
    create_table :entry_images do |t|
      t.references :entry, foreign_key: true
      t.string :alt_text
      t.integer :position

      t.timestamps
    end
  end
end

class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :introduction
      t.string :directedby
      t.string :screenplay
      t.string :character
      t.string :cast
      t.string :productioncom
      t.date :productiontime

      t.timestamps
    end
  end
end

class AddMusicToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :music, :string
  end
end

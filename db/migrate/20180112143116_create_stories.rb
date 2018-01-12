class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.text :text
      t.string :photo

      t.belongs_to :album, foreign_key: true, index: true

      t.timestamps
    end
  end
end
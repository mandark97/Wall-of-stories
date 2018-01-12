class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :status

      t.belongs_to :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end

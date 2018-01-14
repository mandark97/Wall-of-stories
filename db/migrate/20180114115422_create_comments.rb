class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :text
      t.belongs_to :story

      t.timestamps
    end
  end
end

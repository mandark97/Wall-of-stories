class CreateUserProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_profiles do |t|
      t.text :description
      t.string :first_name
      t.string :last_name
      t.string :photo
      t.boolean :private
      t.belongs_to :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end

class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :element
      t.string :weapon
      t.string :character_voice
      t.timestamps
    end
  end
end

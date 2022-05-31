class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :element
      t.string :weapon
      t.string :character_voice
      t.string :has_heavy_past
      t.string :gap_app_age
      t.string :attack_or_support
      t.string :would_betray
      t.string :hot_female
      t.string :ikemen
      t.string :helpful

      t.timestamps
    end
  end
end

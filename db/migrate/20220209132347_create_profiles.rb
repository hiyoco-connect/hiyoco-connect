class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name, null: false
      t.integer :grade, null: false
      t.integer :gender, null: false, default: 0
      t.integer :birthplace_code
      t.integer :living_place_code
      t.date :date_of_birth
      t.integer :blood_type, null: false, default: 0
      t.integer :siblings_relation, null: false, default: 0
      t.text :hobby, null: false
      t.string :times_name
      t.integer :team_dev_will, null: false, default: 0
      t.string :twitter_account
      t.text :self_introduce, null: false
      t.string :avatar

      t.timestamps
    end
  end
end

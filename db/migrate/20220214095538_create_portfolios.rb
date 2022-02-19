class CreatePortfolios < ActiveRecord::Migration[6.1]
  def change
    create_table :portfolios do |t|
      t.references :profile, null: false, foreign_key: true
      t.string :name
      t.string :url
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end

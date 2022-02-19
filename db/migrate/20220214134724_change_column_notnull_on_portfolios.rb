class ChangeColumnNotnullOnPortfolios < ActiveRecord::Migration[6.1]
  def change
    change_column :portfolios, :name, :string, null: false
  end
end

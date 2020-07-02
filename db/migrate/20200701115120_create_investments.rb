class CreateInvestments < ActiveRecord::Migration[6.0]
  def change
    create_table :investments do |t|
      t.string :symbol
      t.string :name
      t.string :type
      t.decimal :last_price

      t.timestamps
    end
  end
end

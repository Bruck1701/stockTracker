class CreateCryptos < ActiveRecord::Migration[6.0]
  def change
    create_table :cryptos do |t|
      t.string :name
      t.decimal :last_price

      t.timestamps
    end
  end
end

class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :investments, :type, :investment_type
  end
end

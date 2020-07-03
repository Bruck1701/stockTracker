class CreateUserInvs < ActiveRecord::Migration[6.0]
  def change
    create_table :user_invs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :investment, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateValeraParams < ActiveRecord::Migration[5.2]
  def change
    create_table :valera_params do |t|
      t.integer :user_id
      t.integer :health
      t.integer :mana
      t.integer :cheerfulness
      t.integer :fatigue
      t.integer :money

      t.timestamps
    end
  end
end

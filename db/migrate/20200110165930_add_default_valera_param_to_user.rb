class AddDefaultValeraParamToUser < ActiveRecord::Migration[5.2]
  def change

    create_table :valera_params do |t|
      t.integer :user_id
      t.integer :health
      t.integer :mana
      t.integer :cheerfulness
      t.integer :fatigue
      t.integer :money
      t.belongs_to :user
      # t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

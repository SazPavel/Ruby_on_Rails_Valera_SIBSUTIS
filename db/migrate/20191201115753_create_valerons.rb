class CreateValerons < ActiveRecord::Migration[5.2]
  def change
    create_table :valerons do |t|

      t.timestamps
    end
  end
end

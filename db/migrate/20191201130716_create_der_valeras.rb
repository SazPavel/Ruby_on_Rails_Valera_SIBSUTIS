class CreateDerValeras < ActiveRecord::Migration[5.2]
  def change
    create_table :der_valeras do |t|

      t.timestamps
    end
  end
end

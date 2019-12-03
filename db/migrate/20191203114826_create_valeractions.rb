class CreateValeractions < ActiveRecord::Migration[5.2]
  def change
    create_table :valeractions do |t|

      t.timestamps
    end
  end
end

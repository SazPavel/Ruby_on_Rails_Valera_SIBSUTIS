class CreateActionLoaders < ActiveRecord::Migration[5.2]
  def change
    create_table :action_loaders do |t|

      t.timestamps
    end
  end
end

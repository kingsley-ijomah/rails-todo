class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end

class CreateCards < ActiveRecord::Migration[8.0]
  def change
    create_table :cards do |t|
      t.text :description
      t.integer :likes

      t.timestamps
    end
  end
end

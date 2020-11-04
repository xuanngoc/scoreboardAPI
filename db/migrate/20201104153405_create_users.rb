class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :wins_count
      t.integer :loses_count

      #t.timestamps
    end
  end
end

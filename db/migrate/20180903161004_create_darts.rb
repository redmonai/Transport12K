class CreateDarts < ActiveRecord::Migration[5.2]
  def change
    create_table :darts do |t|
      t.string :destination
      t.string :duetime
      t.string :direction
      t.string :traintype

      t.timestamps
    end
  end
end

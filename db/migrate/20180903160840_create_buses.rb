class CreateBuses < ActiveRecord::Migration[5.2]
  def change
    create_table :buses do |t|
      t.string :route
      t.string :destination
      t.string :departureduetime

      t.timestamps
    end
  end
end

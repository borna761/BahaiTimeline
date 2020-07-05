class CreateEventtypes < ActiveRecord::Migration[6.0]
  def change
    create_table :eventtypes do |t|
      t.string :eventtype

      t.timestamps null: false
    end
  end
end

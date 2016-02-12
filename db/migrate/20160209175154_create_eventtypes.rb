class CreateEventtypes < ActiveRecord::Migration
  def change
    create_table :eventtypes do |t|
      t.string :eventtype

      t.timestamps null: false
    end
  end
end

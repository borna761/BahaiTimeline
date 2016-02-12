class CreateEventgroups < ActiveRecord::Migration
  def change
    create_table :eventgroups do |t|
      t.string :group

      t.timestamps null: false
    end
  end
end

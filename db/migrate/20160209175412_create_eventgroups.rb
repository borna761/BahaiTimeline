class CreateEventgroups < ActiveRecord::Migration[6.0]
  def change
    create_table :eventgroups do |t|
      t.string :group

      t.timestamps null: false
    end
  end
end

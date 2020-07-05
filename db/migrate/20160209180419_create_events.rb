class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :startYear
      t.integer :startMonth
      t.integer :startDay
      t.time :startTime
      t.integer :endYear
      t.integer :endMonth
      t.integer :endDay
      t.time :endTime
      t.date :displayDate
      t.string :headline
      t.text :text
      t.string :media
      t.string :mediaCredit
      t.string :mediaCaption
      t.string :mediaThumbnail
      t.string :background
      t.references :eventtype, index: true, foreign_key: true
      t.references :eventgroup, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

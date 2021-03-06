class CreateEventSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :event_searches do |t|
      t.string :source
      t.string :keyword
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

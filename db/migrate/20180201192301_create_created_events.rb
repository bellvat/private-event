class CreateCreatedEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :created_events do |t|
      t.integer :created_event_id
      t.integer :creator_id
      t.timestamps
    end
  end
end

class ChangeEventsColumnInCreateEvents < ActiveRecord::Migration[5.1]
  def change
    rename_column :created_events, :created_event_id, :event_id
  end
end

class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :location
      t.date :e_date
      t.timestamps
    end
  end
end

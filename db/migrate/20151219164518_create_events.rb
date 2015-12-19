class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.string :starts_at
      t.string :ends_at
      t.boolean :all_day
      t.text :description
      t.belongs_to :user
      t.belongs_to :room
      t.datetime :start
      t.datetime :end

      t.timestamps null: false
    end
  end
end

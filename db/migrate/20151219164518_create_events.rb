class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :titls
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :all_day
      t.text :description
      t.belongs_to :user
      t.belongs_to :room

      t.timestamps null: false
    end
  end
end

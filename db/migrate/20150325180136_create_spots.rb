class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :location
      t.string :header
      t.string :description
      t.string :details
      t.decimal :price, :precision => 10, :scale => 2
      t.integer :user_id
      t.string :availability
    end
  end
end

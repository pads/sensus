class CreateFeelings < ActiveRecord::Migration
  def change
    create_table :feelings do |t|
      t.integer :mood
      t.text :description

      t.timestamps
    end
  end
end

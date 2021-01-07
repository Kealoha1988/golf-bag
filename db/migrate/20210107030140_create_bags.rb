class CreateBags < ActiveRecord::Migration
  def change
    create_table :bags do |t|
      t.string :club_1
      t.string :club_2
      t.string :club_3
      t.string :club_4
      t.string :club_5
      t.string :club_6
      t.string :club_7
      t.string :club_8
      t.string :club_9
      t.string :club_10
      t.string :club_11
      t.string :club_12
      t.string :club_13

      t.timestamps null: false
    end
  end
end

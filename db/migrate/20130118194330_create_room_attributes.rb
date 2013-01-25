class CreateRoomAttributes < ActiveRecord::Migration
  def change
    create_table :room_attributes do |t|
      t.column :RMRECNBR, :integer
      t.column :CHRSTC, :integer
      t.column :CHRSTC_DESCR, :string
      t.column :CHRSTC_DESCRSHORT, :string
      t.column :CHRSTC_DESCR254, :string
      t.column :CHRSTC_SCHEDULE, :boolean


      t.timestamps
    end
  end
end

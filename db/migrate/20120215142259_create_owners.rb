class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :department_name
      t.string :facility_id 
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_email
      t.text :notes

      t.timestamps
    end
  end
end

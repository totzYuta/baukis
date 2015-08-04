class CreateStaffMembers < ActiveRecord::Migration
  def change
    create_table :staff_members do |t|
      t.string :email, null: false # email adress
      t.string :email_for_index, null: false # email address for searching
      t.string :family_name, null: false 
      t.string :given_name, null: false 
      t.string :hashed_password
      t.date :start_date, null: false 
      t.date :end_date
      t.boolean :suspended, null: false, default: false # flag to suspend

      t.timestamps null: false
    end

    add_index :staff_members, :email_for_index, unique: true
    add_index :staff_members, [ :family_name_kana, :given_name_kana ]
  end
end

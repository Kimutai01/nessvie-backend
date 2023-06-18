class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :full_name
      t.string :email
      t.string :phone
      t.string :address
      t.string :city
      t.string :country
      t.string :zip_code
      t.string :profession
      t.date :dob
      t.boolean :approved, default: false
      t.string :job
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

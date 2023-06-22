class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :title
      t.string :first_name
      t.string :surname
      t.string :email
      t.string :phone
      t.string :address
      t.string :city
      t.string :country
      t.string :post_code
      t.string :sort_code
      t.string :account_number
      t.string :bank_name
      t.string :profession
      t.string :experience
      t.string :birth_country
      t.string :insurance
      t.date :dob
      t.boolean :approved, default: false
      t.string :job
      t.references :user, null: false, foreign_key: true
      t.string :manual_handling_certificate
      t.string :health_and_safety_certificate

      t.string :first_aid_certificate
      t.string :food_hygiene_certificate
      t.string :fire_safety_certificate



      t.timestamps
    end
  end
end

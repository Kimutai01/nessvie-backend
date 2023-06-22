class CreateReferences < ActiveRecord::Migration[7.0]
  def change
    create_table :references do |t|
      t.string :first_name
      t.string :last_name
      t.string :job_title
      t.string :organisation
      t.string :work_email
      t.string :phone_number
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end

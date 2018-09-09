class CreateZipCodeAreaCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :zip_code_area_codes do |t|
      t.references :zip_code, foreign_key: true, index: false, null: false
      t.references :area_code, foreign_key: true, index: false, null: false

      t.timestamps
    end

    add_index :zip_code_area_codes, [:zip_code_id, :area_code_id], unique: true
  end
end

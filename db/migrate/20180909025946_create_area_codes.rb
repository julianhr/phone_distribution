class CreateAreaCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :area_codes do |t|
      t.integer :code, null: false
      t.references :zip_code, foreign_key: true

      t.timestamps
    end
  end
end

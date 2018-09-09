class CreateZipCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :zip_codes do |t|
      t.integer :code
      t.references :city, foreign_key: true

      t.timestamps
    end

    add_index :zip_codes, :code, unique: true
  end
end

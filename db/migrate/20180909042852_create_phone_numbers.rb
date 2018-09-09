class CreatePhoneNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :phone_numbers do |t|
      t.integer :number, null: false
      t.references :area_code, foreign_key: true

      t.timestamps
    end

    add_index :phone_numbers, [:area_code_id, :number], unique: true
  end
end

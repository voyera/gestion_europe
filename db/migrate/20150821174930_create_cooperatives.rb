class CreateCooperatives < ActiveRecord::Migration
  def change
    create_table :cooperatives do |t|
      t.string :name
      t.string :short_name
      t.string :organism
      t.string :institution
      t.string :bank_account

      t.timestamps null: false
    end
  end
end

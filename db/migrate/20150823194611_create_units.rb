class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.belongs_to :cooperative
      t.string :name
      t.string :owner
      t.string :account
      t.string :amount

      t.timestamps null: false
    end
  end
end

class CreateOrder < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :county, null: false
      t.string :postcode, null: false
      t.string :email, null: false
    end
  end
end

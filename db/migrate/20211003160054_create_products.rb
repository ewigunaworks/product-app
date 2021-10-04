class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :user, foreign_key: true
      t.string "name"
      t.integer "price"
      t.string "category"
      t.string "image"
      t.boolean "is_active", default: false
      add_foreign_key :products, :users, foreign_key: true

      t.timestamps
    end
  end
end

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :introduction
      t.integer :price
      t.integer :condition_id
      t.integer :postage_payer_id
      t.integer :prefecture_id
      t.integer :preparation_day_id
      t.integer :category_id
      t.references :user

      t.timestamps
    end
  end
end
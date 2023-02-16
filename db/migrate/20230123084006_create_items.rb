class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :price
      t.string :item_url
      t.string :image_url
      
      t.timestamps
    end
  end
end

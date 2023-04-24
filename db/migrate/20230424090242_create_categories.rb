class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :icon
      t.references :user, null: false, foregin_key: true
      t.timestamps
    end
  end
end

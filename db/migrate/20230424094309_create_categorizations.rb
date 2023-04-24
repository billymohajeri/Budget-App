class CreateCategorizations < ActiveRecord::Migration[7.0]
  def change
    create_table :categorizations do |t|
      t.references :category, null: false, foregin_key: true
      t.references :operation, null: false, foregin_key: true
      t.timestamps
    end
  end
end

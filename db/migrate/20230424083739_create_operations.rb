class CreateOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :operations do |t|
      t.string :name
      t.decimal :amount, default: 0
      t.bigint :user_id, null: false
      t.references :group, null: false, foregin_key: true
      t.references :author, null: false, foregin_key: {to_table: 'usesrs', name: 'author_id'}
      t.timestamps
    end
  end
end

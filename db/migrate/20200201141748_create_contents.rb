class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.integer :good_count
      t.integer :bad_count
      t.timestamps
    end

    add_index :contents, :title, unique: true
  end
end

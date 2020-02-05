class RenameTagsColumn < ActiveRecord::Migration[5.2]
  def change
    remove_index :tags, column: :name
    add_index :tags, :name, unique: false
  end

end

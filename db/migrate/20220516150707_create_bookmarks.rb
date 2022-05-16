class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.string :title
      t.string :link
      t.string :shortay

      t.timestamps
    end
    add_index :bookmarks, :title
  end
end

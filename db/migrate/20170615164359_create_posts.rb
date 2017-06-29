class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
    	t.string :title, null: false
    	t.string :description
    	t.date :date
    	t.time :time
    	t.string :time_ago
    	t.string :photo
      t.timestamps
    end
   	  add_index :posts, :title
  end
end

class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
    	t.references :post, index: true
    	t.string :title
    	t.integer :month_name
    	t.integer :name_of_tag
        t.timestamps
    end
        add_index :tags, :title
  end
end

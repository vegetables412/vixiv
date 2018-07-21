class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|

    	t.integer :user_id
    	t.text :image_id
    	t.text :post_title
    	t.text :post_body
    	t.integer :restriction

      t.timestamps
    end
  end
end

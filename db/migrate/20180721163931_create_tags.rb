class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|

    	t.integer :post_id
    	t.integer :vtuber_id

      t.timestamps
    end
  end
end

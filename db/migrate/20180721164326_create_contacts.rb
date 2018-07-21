class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|

    	t.string :name
    	t.string :email
    	t.integer :type
    	t.string :title
    	t.text :body

      t.timestamps
    end

    add_index :contacts, :type

  end
end

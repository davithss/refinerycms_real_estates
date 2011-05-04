class CreateRealEstates < ActiveRecord::Migration

  def self.up
    create_table :real_estates do |t|
      t.string :house
      t.integer :price
      t.string :address
      t.string :city
      t.string :state
      t.text :description
      t.integer :image_id
      t.string :status
      t.integer :position

      t.timestamps
    end

    add_index :real_estates, :id

    load(Rails.root.join('db', 'seeds', 'real_estates.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "real_estates"})

    Page.delete_all({:link_url => "/real_estates"})

    drop_table :real_estates
  end

end

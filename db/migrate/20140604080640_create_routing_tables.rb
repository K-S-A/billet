class CreateRoutingTables < ActiveRecord::Migration
  def change
    create_table :routing_tables do |t|
      t.string  :name
      t.integer :x
      t.integer :y
      t.integer :project_id
      t.integer :company_id
      t.integer :parent_node_id
      t.string  :parent_node_type

      t.timestamps
    end
  end
end

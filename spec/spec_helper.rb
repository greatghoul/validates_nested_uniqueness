require 'validates_nested_uniqueness'
require 'active_record'
require 'active_record/migration'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
ActiveRecord::Schema.define(:version => 0) do
  create_table :parent_objects do |t|
    t.string :name
  end
  create_table :children do |t|
    t.string :name
    t.integer :parent_object_id
  end
end
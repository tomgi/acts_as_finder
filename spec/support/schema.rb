ActiveRecord::Schema.define do
  self.verbose = false

  create_table :currencies, :force => true do |t|
    t.string :short_name
    t.timestamps
  end

  create_table :languages, :force => true do |t|
    t.string :short_name
    t.string :name
    t.timestamps
  end

  create_table :countries, :force => true do |t|
    t.string :short_name
    t.string :name
    t.timestamps
  end
end
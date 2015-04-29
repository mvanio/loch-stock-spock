
#clear tables first
ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'
  ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
end

batch = Batch.create([{:name => 'SPP012', :due_date => DateTime.parse("14/09/2015 8:00"), :order_date => DateTime.parse("14/03/2015 8:00"), :arrival_date=>DateTime.parse("14/12/2015 8:00")}])
products = Product.create([{:sku=>'FFXA', :description=>'FFX Model A'},{:sku=>'FFXB', :description=>'FFX Model B'}])
product_batches = Quantities.create([{:batch_id => 1, :product_id => 1, :quantity => 50},{:batch_id => 1, :product_id => 2, :quantity => 100}])
MongoMapper.connection = Mongo::Connection.new('store', 27017)
MongoMapper.database = "amibetter_#{Rails.env}"

if defined?(PhusionPassenger)
   PhusionPassenger.on_event(:starting_worker_process) do |forked|
     MongoMapper.connection.connect_to_master if forked
   end
end

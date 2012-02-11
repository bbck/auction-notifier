class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true, format: :email_address, unique: true
end

DataMapper.finalize

get '/' do
  "Hello World!"
end

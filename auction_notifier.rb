class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true, format: :email_address, unique: true
  property :password, BCryptHash, required: true
  attr_accessor :password_confirmation
  
  validates_confirmation_of :password
  
  def password=(password)
    password = nil unless password =~ /\S/
    super
  end
end

DataMapper.finalize

get '/' do
  "Hello World!"
end

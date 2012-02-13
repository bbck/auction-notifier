configure :production do
  use Rack::SSL
  use Rack::Session::Cookie
  use Rack::MethodOverride
  
  set :session_secret, ENV['SESSION']
  set :method_override, true
end

configure :development do
  use Rack::Session::Cookie
  use Rack::MethodOverride
  
  set :method_override, true
  set :raise_errors, true
end

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

before do
  redirect '/login' unless session[:user] or request.path == '/login'
end

get '/' do
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  user = User.first(email: params[:email])
  if user.password == params['password']
    session[:user] = user.email
    redirect '/'
  else
    redirect '/login'
  end
end

delete '/logout' do
  session[:user] = nil
  redirect '/login'
end

# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleApp::Application.config.secret_key_base = '457160e1bf915a063517d7f6d749503133ef484ac76ff51d958c722069ffc0547e6cead7743525b3c87667b32126838fcf5c2acab6025ff9615a7313c3dc4bb4'

require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		#use existing secure_token
		File.read(token_file).chomp
	else
		# generate new token_file
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end
SampleApp::Application.config.secret_key_base = secure_token


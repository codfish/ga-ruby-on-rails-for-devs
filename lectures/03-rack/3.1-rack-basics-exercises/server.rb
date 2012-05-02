require 'rubygems'
require 'rack'

class WebServer

	def initialize
		
		@public_dir = Dir.pwd + "/public"
		
		@four_oh_four_file = @public_dir + "/404.html"
		
		@permission_denied_file = @public_dir + "/403.html"
	
	end
	
	def call(env)
				
		# puts env
		
		begin 
				
			filename = (env["PATH_INFO"].to_str == "/") ? "/index.html" : env["PATH_INFO"].to_str
			
			filepath = @public_dir + filename
		
			File.open(filepath) { |file|
				
				[200, {"Content Type" => "text/html", "Content-Length" => file.size.to_s}, [file.read]]
			}
		
		rescue Errno::ENOENT
			
			[404, {"Content Type" => "text/html"}, [File.read(@four_oh_four_file)]]
		
		rescue Errno::EACCES => e
			
			[403, {"Content Type" => "text/html"}, [File.read(@permission_denied_file)]]
					
		rescue Errno::EISDIR => e
			
			[403, {"Content Type" => "text/plain"}, ["It's a Directory"]]
		
		rescue Exception => e
			
			[500, {"Content Type" => "text/plain"}, [e.inspect]]
			
		end
		
	end
	
end

Rack::Handler::Mongrel.run WebServer.new, :Port => 9292


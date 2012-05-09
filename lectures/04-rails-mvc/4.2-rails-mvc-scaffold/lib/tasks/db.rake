namespace :db do
  desc "Display database configuration."
  task :config => [ :environment ] do
    
    begin
    
      File.open(Rails.root + 'config/database.yml') { |file| 
      
        environment = Rails.env
        
        # raise Exception.new("#{file} doesn't exist.") unless File.exists?(file)
        
        database_config_file = YAML::load(file)
        
        # not working, not sure how to specify new error types
        # raise NoDatabaseFileError.new("#{file} doesn't exist.") unless File.exists?(file)
        # raise DatabaseNotSetError.new("No database set for the #{environment} environment.") if database_config_file[environment]['database'].nil?
        
        if database_config_file[environment].nil?
        
          raise Exception.new("No database set for the #{environment} environment.")
        
        else
        
          puts database_config_file[environment]
        
        end
      }
    
    rescue Exception => e
    
      puts e.inspect
    
    end
    
  end
end


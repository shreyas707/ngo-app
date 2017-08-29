task :clear_data => :environment do 
	Schedule.delete_all
end
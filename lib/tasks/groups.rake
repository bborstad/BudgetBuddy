namespace :groups do
    desc "Rake task to update group averages"
    task :update => :environment do
        Group.update_average
        puts("COMPLETED RAKE TASK")
    end
end
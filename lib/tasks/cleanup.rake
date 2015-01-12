namespace :sensor do
  desc "cleanup old sensor data"
  task cleanup: :environment do
    puts (Sensor.where(created_at: "2013-01-01 12:00:00 -0700"..(Time.now - 7.days).to_s).count)
    Sensor.where(created_at: "2013-01-01 12:00:00 -0700"..(Time.now - 7.days).to_s).delete_all
  end
end

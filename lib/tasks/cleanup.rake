namespace :sensor do
  desc "cleanup old sensor data"
  task cleanup: :environment do
    Sensor.where(created_at: "2013-01-01 12:00:00 -0700"..(Time.now - 14.days).to_s).delete_all
  end
end

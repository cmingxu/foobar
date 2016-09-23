namespace :es do
  desc "populate accessories in db into elasticsearch"
  task :populate => :environment do
    Accessory.includes(:conditions, :condition_values).find_each do |accessory|
      accessory.es_index
    end
  end
end

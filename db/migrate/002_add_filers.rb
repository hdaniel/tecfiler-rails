migration 2, :add_filers do

  up do
    create_table(:filers) do |t|
      
      column :id, Integer, :serial => true
      column :user_id, Integer, :required => true
      
      column :version, String, :required => true

      column :filer_type, String, :required => true

      column :name_prefix, String
      column :name_first, String, :required => true
      column :name_mi, String
      column :name_nick, String
      column :name_last, String, :required => true
      column :name_suffix, String

      column :address_street, String, :required => true
      column :address_suite, String
      column :address_city, String, :required => true
      column :address_state, String, :required => true
      column :address_zip, String, :required => true
      column :address_changed, Boolean, :default => false

      column :phone, String, :required => true

      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end

  down do
    drop_table :filers
  end

end

migration 5, :add_contributions do

  up do
    create_table(:contributions) do |t|
      column :id, Integer, :serial => true

      column :version, String, :required => true, :default => VERSION
      column :rec_type, Enum[:RECEIPT, :PLEDGE], :required => true
      column :form_type, Enum[:A1, :A2, :AJ, :AL, :B1, :B2, :B3, :BJ, :C, :C2, :D], :required => true
      column :contributor_type, Enum[:INDIVIDUAL, :ENTITY], :required => true
      column :name_title, String, :length => 25        # e.g. "Mr."
      column :name_first, String, :length => 45
      column :name_last, String, :length => 100, :required => true
      column :name_suffix, String, :length => 10       # e.g. "Jr."
      column :address, String, :length => 55, :required => @require_code_r_items
      column :address2, String, :length => 55
      column :city, String, :length => 30, :required => @require_code_r_items
      column :state, String, :length => 2, :required => @require_code_r_items, :format => :state_code
      column :zip, String, :length => 10, :required => @require_code_r_items, :format => :zip_code
      column :is_out_of_state_pac, Boolean
      column :pac_id, String, :length => 9
      column :date, Date, :required => true
      column :amount, Decimal, :precision => 12, :scale => 2, :required => true
      column :in_kind_description, String, :length => 100
      column :employer, String, :length => 60
      column :occupation, String, :length => 60

      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end

  down do
    drop_table :contributions
  end

end

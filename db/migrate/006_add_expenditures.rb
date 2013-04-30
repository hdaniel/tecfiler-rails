migration 6, :add_expenditures do

  up do
    create_table(:expenditures) do |t|
      column :id, Integer, :serial => true

      column :version, String, :required => true, :default => VERSION
      column :rec_type, Enum[:EXPENDITURE], :required => true
      column :form_type, Enum[:F, :FL, :G, :H, :I], :required => true
      column :item_id, String, :length => 20
      column :payee_type, Enum[:INDIVIDUAL, :ENTITY], :required => true
      column :payee_name_title, String, :length => 15        # e.g. "Mr."
      column :payee_name_first, String, :length => 45
      column :payee_name_last, String, :length => 100, :required => true
      column :payee_name_suffix, String, :length => 10       # e.g. "Jr."
      column :payee_address, String, :length => 55, :required => @require_code_r_items
      column :payee_address2, String, :length => 55
      column :payee_city, String, :length => 30, :required => @require_code_r_items
      column :payee_state, String, :length => 2, :required => @require_code_r_items, :format => :state_code
      column :payee_zip, String, :length => 10, :required => @require_code_r_items, :format => :zip_code
      column :date, Date, :required => true
      column :amount, Decimal, :precision => 12, :scale => 2, :required => true
      column :description, String, :length => 100, :required => @require_code_r_items
      column :reimbursement_expected, Boolean
      column :candidate_name_title, String, :length => 15        # e.g. "Mr."
      column :candidate_name_first, String, :length => 45
      column :candidate_name_last, String, :length => 100
      column :candidate_name_suffix, String, :length => 10       # e.g. "Jr."
      column :office_held_code, Enum[:GOV, :LGV, :AG, :COM, :LC, :AC, :RC, :SCJ, :CAJ, :SEN, :REP, :COA, :DJ, :DA, :SBE, :OTH]
      column :office_held_description, String, :length => 30
      column :office_held_district, String, :length => 4
      column :office_sought_code, Enum[:GOV, :LGV, :AG, :COM, :LC, :AC, :RC, :SCJ, :CAJ, :SEN, :REP, :COA, :DJ, :DA, :SBE, :OTH]
      column :office_sought_description, String, :length => 30
      column :office_sought_district, String, :length => 4
      column :backreference_id, String, :length => 20
      column :is_corp_contrib, Boolean

      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end

  down do
    drop_table :expenditures
  end

end

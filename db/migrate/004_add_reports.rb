migration 4, :add_reports do

  up do
    create_table(:reports) do |t|
      column :id, Integer, :serial => true
      column :filer_id, Integer, :required => true
      column :status, String
      
      column :report_type, Enum[:JAN15, :JUL15, :ELECTION_30DAY, :ELECTION_8DAY, 
                                :RUNNOFF, :EXCEED_500, :TREASURER_APPT, :FINAL], 
                                :required => true
          
      column :period_begin, Date, :required => true
      column :period_end, Date, :required => true
      column :election_date, Date
      column :election_type, Enum[:PRIMARY, :RUNOFF, :GENERAL, :SPECIAL]
      column :office_held, String
      column :office_sought, String

      column :contribution_csv_file_name, String, :length => 255
      column :contribution_csv_content_type, String, :length => 255
      column :contribution_csv_file_size, Integer
      column :contribution_csv_updated_at, DateTime

      column :expenditure_csv_file_name, String, :length => 255
      column :expenditure_csv_content_type, String, :length => 255
      column :expenditure_csv_file_size, Integer
      column :expenditure_csv_updated_at, DateTime

      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end

  down do
    drop_table :reports
  end

end

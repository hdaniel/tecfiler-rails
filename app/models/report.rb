class Report

  include DataMapper::Resource
  include DataMapper::Validate
  include Paperclip::Resource

 	belongs_to :filer 
  # has n, :contributions
  # has n, :expenditures

  property :id, Serial
	property :filer_id, Integer, :required => true
  property :status, String

  property :report_type, Enum[:JAN15, :JUL15, :ELECTION_30DAY, :ELECTION_8DAY, :RUNNOFF, :EXCEED_500, :TREASURER_APPT, :FINAL], :required => true
      
  property :period_begin, Date, :required => true
  property :period_end, Date, :required => true

  property :election_date, Date
      
  # XXX - Should :RUNOFF be an election type or a modifier to the election type?
  property :election_type, Enum[:PRIMARY, :RUNOFF, :GENERAL, :SPECIAL]
  validates_presence_of :election_type, :if => lambda{|t| ! t.office_sought.empty?}

  property :office_held, String
  property :office_sought, String
  validates_presence_of :office_sought, :if => lambda{|t| ! t.election_type.nil?}

  property :contribution_csv_file_name, String, :length => 255
  property :contribution_csv_content_type, String, :length => 255
  property :contribution_csv_file_size, Integer
  property :contribution_csv_updated_at, DateTime

  property :expenditure_csv_file_name, String, :length => 255
  property :expenditure_csv_content_type, String, :length => 255
  property :expenditure_csv_file_size, Integer
  property :expenditure_csv_updated_at, DateTime

	property :created_at, DateTime
	property :updated_at, DateTime

  has_attached_file :contribution_csv
  # validates_attachment_size :contribution_csv, :in => 1..5120
  # validates_attachment_content_type :contribution_csv, :content_type => "image/png"

  has_attached_file :expenditure_csv
  # validates_attachment_size :expenditure_csv, :in => 1..5120
  # validates_attachment_content_type :expenditure_csv, :content_type => "image/png"

end

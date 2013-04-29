class Filer

  include DataMapper::Resource

 	belongs_to :user 
  has 1, :treasurer
  has n, :reports

	property :id, Serial
	property :user_id, Integer, :required => true

  property :filer_type, String, :required => true

  property :version, String, :required => true, :default => VERSION

	property :name_prefix, String
	property :name_first, String, :required => true
	property :name_mi, String
	property :name_nick, String
	property :name_last, String, :required => true
	property :name_suffix, String

	property :address_street, String, :required => true
	property :address_suite, String
	property :address_city, String, :required => true
	property :address_state, String, :required => true
	property :address_zip, String, :required => true
	property :address_changed, Boolean, :default => false

	property :phone, String, :required => true
  validates_format_of :phone, :with => /(^$)|(^(\d\d\d-)?\d\d\d-\d\d\d\d(x\d+)?$)/,
    :message => 'Please enter a valid phone number (e.g. "512-555-1234x200")',
    :if => Proc.new { |f| !f.phone.blank? }  

	property :created_at, DateTime
	property :updated_at, DateTime

  def name
    a = [
      self.name_prefix,
      self.name_first,
      self.name_mi,
      self.name_nick.empty? ? nil : "(#{self.name_nick})",
      self.name_last,
      self.name_suffix,
    ].reject {|x| x.empty?}.join(" ")        
  end
      
  def address
    addr = []
    a = self.address_street
    a << " ste " + self.address_suite unless self.address_suite.nil?
    addr << a
    addr << self.address_city + ", " + self.address_state + " " + self.address_zip
    return addr        
  end

end

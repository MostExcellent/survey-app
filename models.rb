class Form
  
  include DataMapper::Resource
  property :id,       Serial
  
  property :title,     String
  
  has n, :form_fields 
  has n, :form_entries
  
  # In order for this to work, it needs to be a class method
  # def self.find_by_name(name)
  #   self.first(:name => name)
  # end

end

class FormField
  
  include DataMapper::Resource
  property :id,       Serial
  
  property :name,     String
  
  has n, :field_entries
  belongs_to :form

end

class FormEntry
  
  include DataMapper::Resource
  property :id,         Serial
  
  property :author,     String
  
  property :created_at, DateTime
  
  has n, :field_entries
  belongs_to :form

end

class FieldEntry
  
  include DataMapper::Resource
  property :id,       Serial
  
  property :value,    String
  
  belongs_to :form_field
  belongs_to :form_entry

end

DataMapper.finalize()
DataMapper.auto_upgrade!()
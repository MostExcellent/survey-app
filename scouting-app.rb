# TO FIX:
# Null class when using findbyname to delete, make admin, ban and unban.

require "sinatra"

require "./setup"

require "./models"

helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end
end

get("/") do
  forms = Form.all
  erb(:index, :locals => { :forms => forms })
end

get("/forms/new-entry/*") do |form_id|
  form = Form.get(form_id)
  erb(:showform, :locals => { :form => form })
end

post("/forms/*/newreply") do |form_id|
  form = Form.get(form_id)
  form_entry = form.form_entries.new
  
  params[:form_fields].each do |field_id, value|
    form_entry.field_entries.new(:form_field_id => field_id, :value => value)
  end
  
  if form_entry.save
    redirect("/")
  else
    "Oh no. :("
  end
end

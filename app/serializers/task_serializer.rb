class TaskSerializer < ActiveModel::Serializer
  #Serializer filter out the atributes of Task or customize attributes for JSON 
  #attributes is a built in method provided by serializer gem 
  attributes :id, :name, :priority, :converted_due_date
  belongs_to :user #let Serializer know about the belongs_to relationship so it knows to send it with the JSON 





  # method to customize the attribute
  # In this case change the due_date json because default looks ugly 
  def converted_due_date
    return object.due_date.strftime('%A, %b %d')
  end

end

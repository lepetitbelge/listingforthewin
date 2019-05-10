class List
  attr_reader :first_name, :last_name, :email, :scope_id

  def initialize(first_name, last_name, email, scope_id)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @scope_id = scope_id
  end
end

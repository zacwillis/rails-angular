class CustomersController < ApplicationController
  def index
    if params[:keywords].present?
      wr = []
      keywords = params[:keywords]
      if keywords =~ /@/
        wr << "lower(email) Ilike '%#{keywords}%'"
      else
        name_array = keywords.split(" ")
        if name_array.length > 1
          wr << "lower(first_name) Ilike '#{name_array.first.downcase}%'"
          wr << "lower(last_name) Ilike '#{name_array.last.downcase}%'"
        else
          wr << "(lower(first_name) Ilike '#{name_array.first.downcase}%' or lower(last_name) Ilike '#{name_array.last.downcase}%')"
        end
      end
      where_clause = wr.length > 1 ? wr.join(' and ') : wr.first
      @customers = Customer.where(where_clause)
    else
      @customers = []
    end
  end
end
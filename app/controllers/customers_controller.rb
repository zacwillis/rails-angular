class CustomersController < ApplicationController

  PAGE_SIZE = 10

  def index
    @page = (params[:page] || 0).to_i
    @keywords = params[:keywords]
    if @keywords.present?
      wr = []
      
      if @keywords =~ /@/
        wr << "lower(email) Ilike '%#{@keywords}%'"
      else
        name_array = @keywords.split(" ")
        if name_array.length > 1
          wr << "lower(first_name) Ilike '#{name_array.first.downcase}%'"
          wr << "lower(last_name) Ilike '#{name_array.last.downcase}%'"
        else
          wr << "(lower(first_name) Ilike '#{name_array.first.downcase}%' or lower(last_name) Ilike '#{name_array.last.downcase}%')"
        end
      end
      where_clause = wr.length > 1 ? wr.join(' and ') : wr.first
      @customers = Customer.where(where_clause).offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
    else
      @customers = []
    end

    respond_to do |format|
      format.html {}
      format.json {
        render json: { customers: @customers }
      }
    end
  end
end
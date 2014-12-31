class HomeController < ApplicationController
  def index
  	if params[:data]
  		@doc = eval(params[:data])
  		#session[:data] = @info
  		# render text: @info.to_csv
  	end	
  	# respond_to do |format|
   #    format.html
   #    format.csv { render text: @info.to_csv } if @info
   #    binding.pry
   #  end
  end

  def show_result
    @selected_data = session[:data]
    respond_to do |format|
      format.html
      format.csv { send_data @selected_data.to_csv }
      #format.xls  #{ send_data @selected_data.to_csv(col_sep: "\t"),filename: params[:name] }
    end
  end

  def test

  end	

end

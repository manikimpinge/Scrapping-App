class HomeController < ApplicationController
  def index
  	if params[:data]
      @first= 1
      @last = 10
      session[:data] = params[:data]
  	end	
  end

  def get_data
      @info = []
      start_n = params[:num].to_i
      end_n = start_n.to_i + 2
      (start_n..end_n).each do |n|
        @doc = eval(session[:data])
      end  
      render :json => {:data => @info, :num => end_n}.to_json 
  end  

  def show_result
    @selected_data = session[:data]
    respond_to do |format|
      format.html
      format.csv { send_data @selected_data.to_csv }
    end
  end

  def test

  end	

end

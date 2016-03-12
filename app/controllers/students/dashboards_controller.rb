class Students::DashboardsController < ApplicationController
  def show
    if @student = Student.find_by(id: params[:student_id])

    else
      flash[:alert] = 'Some thing went wrong!'
      redirect_to :root
    end
  end
end

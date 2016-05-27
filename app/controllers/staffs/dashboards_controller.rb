module Staffs
  class DashboardsController < ApplicationController
    def dashboards
      @courses = filtered_courses
    end

    private

    def filtered_courses
      Course.all
    end
  end
end


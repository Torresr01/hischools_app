class SchoolsController < ApplicationController
def index
		@education_data = JSON.load(RestClient.get('http://api.education.com/service/service.php?f=schoolSearch&key=068b396b4a183cb329a791a26099b837&sn=sf&v=4&city=san+francisco&state=ca&resf=json'))

		@education_data.each do |school_data|
			@school = School.new
			@school.name = school_data['school']['schoolname']
			@school.address = school_data['school']['address']
			@school.url = school_data['school']['url']
			@school.total = school_data['school']['enrollment']['total'].to_s
			@school.schooltype = school_data['school']['schooltype']
			@school.city = school_data['school']['city']
			@school.state = school_data['school']['state']
			@school.zip = school_data['school']['zip'].to_s
			@school.save
		end
  	@school = School.all

  	@school = params[:q] ? School.search_name(params[:q]) : School.all
	end

	def show
		@school = School.all
		@school = School.find_by_id(params[:id])
	end 

	def new
	  @school = School.new
  end

	def create
		@school = School.new(school_params)

		if @school.save
				redirect_to @school
		else
				render 'new'
	  end
	end
	
  def edit
  	@school = School.find_by_id(params[:id])
  end

  def update
    @school = School.find(params[:id])
   
    if @school.update(school_params)
      redirect_to action: "show", notice: 'Painting successfully updated!'
    else
      render 'edit'
    end
  end

  private

  def school_params
    params.require('school').permit(:name, :address, :total, :schooltype, :city, :state, :url)
  end

end

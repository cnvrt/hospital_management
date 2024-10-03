class DoctorsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role

  def index
    @patients = Patient.all
  end
  
  def patients
    @patients = Patient.all # You may want to filter this to show only the patients assigned to the doctor
  end

  # GET /patients/:id
  def show
    @patient = Patient.find(params[:id])
  end
  
  def dashboard
    @patients_per_day = Patient.group("DATE(created_at)").count
    @patients_per_days = Patient.where("created_at >= ?", 7.days.ago)
                              .group("DATE(created_at)")
                              .count

  @labels = @patients_per_days.keys.map { |date| date.strftime("%Y-%m-%d") } # Adjust format as needed
  end

  private

  def set_patient
  end

  def check_role
    redirect_to root_path, alert: 'Unauthorized access' unless current_user.doctor?
  end
end

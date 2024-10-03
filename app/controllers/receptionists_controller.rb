class ReceptionistsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to receptionists_path, notice: 'Patient registered successfully.'
    else
      render :new
    end
  end

  private

  def check_role
    redirect_to root_path unless current_user.receptionist?
  end

  def patient_params
    params.require(:patient).permit(:name, :age, :gender)
  end
end

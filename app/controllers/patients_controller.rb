class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_receptionist
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  def index
    @patients = Patient.all
  end

  # GET /patients/:id
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # POST /patients
  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to @patient, notice: 'Patient was successfully created.'
    else
      render :new
    end
  end

  # GET /patients/:id/edit
  def edit
  end

  # PATCH/PUT /patients/:id
  def update
    if @patient.update(patient_params)
      redirect_to @patient, notice: 'Patient was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /patients/:id
  def destroy
    @patient.destroy
    redirect_to patients_url, notice: 'Patient was successfully destroyed.'
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :age, :gender, :medical_history)
  end
  
  def authorize_receptionist
    redirect_to root_path, alert: 'Unauthorized access' unless current_user.receptionist?
  end
end
  
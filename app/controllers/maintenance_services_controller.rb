class MaintenanceServicesController < ApplicationController
  before_action :set_maintenance_service, only: %i[ show edit update destroy ]

  # GET /maintenance_services or /maintenance_services.json
  def index
    @search_plate_number = ''
    @status = ''
    @search_plate_number = params[:search_plate_number] if params[:search_plate_number]
    @status = params[:status] if params[:status]

    @maintenance_services = MaintenanceService.filter_services(@search_plate_number, @status)
  end

  # GET /maintenance_services/1 or /maintenance_services/1.json
  def show
  end

  # GET /maintenance_services/new
  def new
    @maintenance_service = MaintenanceService.new
  end

  # GET /maintenance_services/1/edit
  def edit
  end

  # POST /maintenance_services or /maintenance_services.json
  def create
    @maintenance_service = MaintenanceService.new(maintenance_service_params)

    respond_to do |format|
      if @maintenance_service.save
        format.html { redirect_to @maintenance_service, notice: "El servicio fue creado correctamente." }
        format.json { render :show, status: :created, location: @maintenance_service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintenance_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance_services/1 or /maintenance_services/1.json
  def update
    respond_to do |format|
      if @maintenance_service.update(maintenance_service_params)
        format.html { redirect_to @maintenance_service, notice: "El servicio fue actualizado correctamente." }
        format.json { render :show, status: :ok, location: @maintenance_service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintenance_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance_services/1 or /maintenance_services/1.json
  def destroy
    @maintenance_service.destroy

    respond_to do |format|
      format.html { redirect_to maintenance_services_path, status: :see_other, notice: "El servicio fue eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_service
      @maintenance_service = MaintenanceService.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def maintenance_service_params
      params.require(:maintenance_service).permit(:car_id, :description, :status, :date)
    end
end

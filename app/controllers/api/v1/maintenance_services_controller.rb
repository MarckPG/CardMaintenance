module Api
  module V1
    class MaintenanceServicesController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        @maintenance_services = MaintenanceService.order('created_at DESC')
        render json: {status: 'SUCCESS', data:@maintenance_services}, status: :ok
      end

      def show
        @maintenance_service = MaintenanceService.find(params[:id])
        render json: {status: 'SUCCESS', data:@maintenance_service}, status: :ok
      end

      def create
        @maintenance_service = MaintenanceService.new(maintenance_service_params)

        if @maintenance_service.save
          render json: {status: 'SUCCESS', data:@maintenance_service, message:'Servicio creado correctamente'}, status: :ok
        else
          render json: {status: 'Error', data:@maintenance_service.errors}, status: :unprocessable_entity
        end
      end

      def update
        @maintenance_service = MaintenanceService.find(params[:id])

        if @maintenance_service.update(maintenance_service_params)
          render json: {status: 'SUCCESS', data:@maintenance_service}, status: :ok
        else
          render json: {status: 'Error', data:@maintenance_service.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        @maintenance_service = MaintenanceService.find(params[:id])
        @maintenance_service.destroy

        render json: {status: 'SUCCESS', data:@maintenance_service}, status: :ok
      end

      private
        def maintenance_service_params
          params.permit(:car_id, :description, :status, :date)
        end

    end
  end
end

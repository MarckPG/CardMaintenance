module Api
  module V1
    class CarsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        @cars = Car.order('created_at DESC')
        render json: {status: 'SUCCESS', data:@cars}
      end

      def show
        @car = Car.find(params[:id])

        render json: {status: 'SUCCESS', data:@car}, status: :ok
      end

      def create
        @car = Car.new(car_params)

        if @car.save
          render json: {status: 'SUCCESS', data:@car}, status: :ok
        else
          render json: {status: 'Error', data:@car.errors}, status: :unprocessable_entity
        end
      end

      def update
        @car = Car.find(params[:id])

        if @car.update(car_params)
          render json: {status: 'SUCCESS', data:@car}, status: :ok
        else
          render json: {status: 'Error', data:@car.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        @car = Car.find(params[:id])
        @car.destroy

        render json: {status: 'SUCCESS', data:@car}, status: :ok
      end

      private
        def car_params
          params.permit(:plate_number, :model, :year)
        end

    end
  end
end

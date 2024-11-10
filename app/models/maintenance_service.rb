class MaintenanceService < ApplicationRecord
  validates_uniqueness_of :description, presence: true, allow_blank: false, message: "Favor de ingresar una descripción"
  enum status: { pending: 0, in_progress: 1, completed: 2 }
  belongs_to :car

   before_create :default_values

   def default_values
     self.date = Date.today
   end

   def self.filter_services(plate_number, status)

     _where_plate_number = ''
     _where_status = '0=0'

     if !plate_number.blank?
       list_car = Car.select(:id).where("plate_number like '%#{plate_number}%'")
       map_car = list_car.map{ |key| key.id }.join(', ')
       _where_plate_number = " and car_id in (#{map_car})"
     end

     if !status.blank?
       _where_status = " status = #{status} "
     end

     ms = MaintenanceService.where("#{_where_status} #{_where_plate_number}")

     ms

   end
end

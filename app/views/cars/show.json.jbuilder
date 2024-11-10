# json.partial! "cars/car", car: @car
json.extract! @car, :plate_number, :model, :year
json.services @car.maintenance_services

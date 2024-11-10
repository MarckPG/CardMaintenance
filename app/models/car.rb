class Car < ApplicationRecord
  validates_uniqueness_of :plate_number, message:'Estas placas ya fueron registradas con anterioridad' , allow_blank: false
  validates :year,
              numericality: {
                              only_integer: true,
                              greater_than_or_equal_to: 1900,
                              less_than_or_equal_to: Date.today.year,
                              message: "El año debe de ser entre 1900 y #{Date.today.year}"
                              }

 # inclusion: { in: 1900..Date.today.year },
  has_many :maintenance_services
end

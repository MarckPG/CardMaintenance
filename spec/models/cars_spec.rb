require 'rails_helper'

RSpec.describe Car, type: :model do
  it 'con placas y años puede regstrar' do
    car = Car.new(plate_number: 'TT232816', year: '1999')
    expect(car).to be_valid
  end

  it 'no se puede registrar solo con el modelo' do
    car = Car.new(model: 'Ford-gm-1111')
    expect(car).not_to be_valid
  end
end

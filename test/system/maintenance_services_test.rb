require "application_system_test_case"

class MaintenanceServicesTest < ApplicationSystemTestCase
  setup do
    @maintenance_service = maintenance_services(:one)
  end

  test "visiting the index" do
    visit maintenance_services_url
    assert_selector "h1", text: "Maintenance Services"
  end

  test "creating a Maintenance service" do
    visit maintenance_services_url
    click_on "New Maintenance Service"

    fill_in "Car", with: @maintenance_service.car_id
    fill_in "Date", with: @maintenance_service.date
    fill_in "Description", with: @maintenance_service.description
    fill_in "Status", with: @maintenance_service.status
    click_on "Create Maintenance service"

    assert_text "Maintenance service was successfully created"
    click_on "Back"
  end

  test "updating a Maintenance service" do
    visit maintenance_services_url
    click_on "Edit", match: :first

    fill_in "Car", with: @maintenance_service.car_id
    fill_in "Date", with: @maintenance_service.date
    fill_in "Description", with: @maintenance_service.description
    fill_in "Status", with: @maintenance_service.status
    click_on "Update Maintenance service"

    assert_text "Maintenance service was successfully updated"
    click_on "Back"
  end

  test "destroying a Maintenance service" do
    visit maintenance_services_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Maintenance service was successfully destroyed"
  end
end

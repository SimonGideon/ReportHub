require "application_system_test_case"

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:one)
  end

  test "visiting the index" do
    visit reports_url
    assert_selector "h1", text: "Reports"
  end

  test "should create report" do
    visit reports_url
    click_on "New report"

    fill_in "Customer feedback", with: @report.customer_feedback
    fill_in "Date", with: @report.date
    fill_in "Department", with: @report.department_id
    fill_in "End time", with: @report.end_time
    fill_in "Location", with: @report.location
    fill_in "Optional note", with: @report.optional_note
    fill_in "Quantity", with: @report.quantity
    fill_in "Remarks", with: @report.remarks
    fill_in "Start time", with: @report.start_time
    fill_in "Task description", with: @report.task_description
    fill_in "User", with: @report.user_id
    click_on "Create Report"

    assert_text "Report was successfully created"
    click_on "Back"
  end

  test "should update Report" do
    visit report_url(@report)
    click_on "Edit this report", match: :first

    fill_in "Customer feedback", with: @report.customer_feedback
    fill_in "Date", with: @report.date
    fill_in "Department", with: @report.department_id
    fill_in "End time", with: @report.end_time
    fill_in "Location", with: @report.location
    fill_in "Optional note", with: @report.optional_note
    fill_in "Quantity", with: @report.quantity
    fill_in "Remarks", with: @report.remarks
    fill_in "Start time", with: @report.start_time
    fill_in "Task description", with: @report.task_description
    fill_in "User", with: @report.user_id
    click_on "Update Report"

    assert_text "Report was successfully updated"
    click_on "Back"
  end

  test "should destroy Report" do
    visit report_url(@report)
    click_on "Destroy this report", match: :first

    assert_text "Report was successfully destroyed"
  end
end

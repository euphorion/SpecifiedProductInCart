*** Settings ***
Documentation     A test suite with a single Gherkin style test.
Resource          resource.robot
Test Teardown     Close Browser

*** Test Cases ***
Specified Product In Cart
    Given Browser Is Opened To Product Page "2"
    When User Adds Specific Product To Cart
    Then Cart Contains Specified Product

*** Keywords ***
Browser Is Opened To Product Page "${PRODUCT MODEL}"
    Open Browser To Product Page "${PRODUCT MODEL}"

User Adds Specific Product To Cart
    Add Product To Cart

Cart Contains Specified Product
    Verify Cart Contains Specified Product
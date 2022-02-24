*** Settings ***
Documentation     A resource file for testing cart
Library           SeleniumLibrary

*** Variables ***
${SERVER}         http://automationpractice.com        
${BROWSER}        Firefox
${DELAY}          0.5s
${QUANTITY}       3
${SIZE}           M
${COLOR}          Black

*** Keywords ***
Open Browser To Product Page "${PRODUCT MODEL}"
    ${PRODUCT URL} =  Catenate  SEPARATOR=  ${SERVER}/index.php?id_product=${PRODUCT MODEL}  &controller=product
    Log  ${PRODUCT URL}
    Open Browser    ${PRODUCT URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Page Should Be Open For Product ${PRODUCT MODEL}

Page Should Be Open For Product ${PRODUCT MODEL}
    Element Text Should Be    //*[@id="product_reference"] >> tag:span  demo_${PRODUCT MODEL}

Add Product To Cart
    Set Product Quantity
    Set Product Size
    Set Product Color
    Add To Cart
    Sleep  2s

Set Product Quantity
    FOR  ${i}  IN RANGE  ${QUANTITY}-1
        Click Element  class:product_quantity_up
    END

Set Product Size
    Select From List By Label  //*[@id="group_1"]  ${SIZE} 

Set Product Color
    Click Element  name=${COLOR}

Add To Cart
    Click Button  class:exclusive

Verify Cart Contains Specified Product
    Verify Product Quantity
    Verify Product Size
    Verify Product Color

Verify Product Quantity
    Element Text Should Be  id=layer_cart_product_quantity  ${QUANTITY}

Verify Product Size
    Element Should Contain  id=layer_cart_product_attributes  ${SIZE}

Verify Product Color
    Element Should Contain  id=layer_cart_product_attributes  ${COLOR}
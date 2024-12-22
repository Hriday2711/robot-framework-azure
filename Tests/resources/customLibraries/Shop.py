from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class Shop:


    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary");


    @keyword
    def hello_world(self):
        print("hello")

    @keyword
    def add_items_to_cart_and_checkout(self, productsList):
        i = 1
        productTitles = self.selLib.get_webelements("css:.card-title")

        for productTitle in productTitles:
            if  productTitle.text in productsList:
                self.selLib.click_element("xpath:(//*[@class='card-footer'])["+str(i)+"]/button")

        i =  i+1
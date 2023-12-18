import unittest
import requests

class TestWebsiteConnection(unittest.TestCase):

    def test_website_loading(self):
        url = "https://atg.world"

        try:
            # Attempt to connect to the website
            response = requests.get(url)

            # Check if the response status code indicates a successful connection
            self.assertEqual(response.status_code, 200, f"Failed to load website. Status code: {response.status_code}")

            print("Website loaded successfully!")

        except requests.RequestException as e:
            print(f"Failed to connect to the website: {e}")
            self.fail("Website failed to load.")

if __name__ == '__main__':
    unittest.main()

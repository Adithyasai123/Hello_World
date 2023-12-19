import unittest
import requests

class TestWebsiteConnection(unittest.TestCase):

    def test_website_loading(self):
        url = "https://atg.world"

        try:
            # Attempt to connect to the website
            print(f"Attempting to connect to {url}")
            response = requests.get(url)

            # Check if the response status code indicates a successful connection
            self.assertEqual(response.status_code, 200, f"Failed to load website. Status code: {response.status_code}")

            # Print a message indicating a successful connection
            print("Connection successful. Website is up!")

        except requests.RequestException as e:
            # Print an error message if the connection fails
            print(f"Failed to connect to the website: {e}")
            self.fail("Website failed to load.")

if __name__ == '__main__':
    unittest.main()

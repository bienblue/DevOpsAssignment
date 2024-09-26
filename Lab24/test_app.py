import unittest
from app import app

class FlaskTestCase(unittest.TestCase):

    def setUp(self):
        self.app = app.test_client()
        self.app.testing = True

    def test_hello_world(self):
        response = self.app.get('/api/hello')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json, {'message': 'Hello, World!'})

    def test_greet(self):
        response = self.app.post('/api/greet', json={'name': 'Alice'})
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json, {'message': 'Hello, Alice!'})

        response = self.app.post('/api/greet', json={})
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json, {'message': 'Hello, Guest!'})

if __name__ == '__main__':
    unittest.main()

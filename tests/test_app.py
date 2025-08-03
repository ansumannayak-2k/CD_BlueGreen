import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from app.app import app 

def test_index():
    tester = app.test_client()
    res = tester.get('/')
    assert res.status_code == 200
    assert b'Blue-Green' in res.data

import pytest
from myproject.module1 import add

def test_add():
    assert add(1, 2) == 3
    assert add(-1, 1) == 0
    assert add(0, 0) == 0

def test_add_type_error():
    with pytest.raises(TypeError):
        add(1, "2")

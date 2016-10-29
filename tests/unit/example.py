#################################
# NOTICE:
#  - only implement unit tests!
#################################

from todo import test, APPVER

def test_todo():
    v = test()
    parts = v.split(" ")
    print('parts: %s' % parts)
    assert parts[3] == APPVER


#---------------------------------
# use the following to force a fail
#---------------------------------
#def test_make_you_fail():
#    v = test()
#    parts = v.split(" ")
#    assert parts[1] == APPVER

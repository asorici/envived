from coresql.utils.validations import assert_arg_type, assert_arg_list_type


class ListWrapper(object):
    
    def __init__(self, argList = None, limit = 100, elemType = str):
        if not argList is None:
            self.setList(argList)
        else:
            self.argList = []
        self.setLimit(limit)
        if self.isFull():
            raise TypeError('Argument list limit: ' + str(limit))
        self.elemType = elemType
    
    def isFull(self):
        return len(self.argList) >= self.limit
    
    def addItem(self, item):
        assert_arg_type(item, self.elemType)
        self.argList.append(item)
    
    def removeItem(self, item):
        assert_arg_type(item, self.elemType)
        self.argList.remove(item)
    
    def getList(self):
        return self.argList
    
    def setList(self, argList):
        assert_arg_type(argList, list)
        assert_arg_list_type(argList, self.elemType)
        self.argList = argList
    
    def getLimit(self):
        return self.limit
    
    def setLimit(self, limit):
        assert_arg_type(limit, int)
        self.limit = limit
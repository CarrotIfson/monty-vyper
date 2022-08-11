# @version ^0.3.3 
owner: public(address)

event Deposit:
    sender: indexed(address)
    amount: uint256

#executed whenever a non existant funciton is called
#typically used to receive Ether
@external
@payable
def __default__():
    log Deposit(msg.sender, msg.value)
    
@external
@payable
def deposit():
    log Deposit(msg.sender, msg.value)

@external
@view
def getBalance() -> uint256:
    # Get balance of Ether stored in this contract
    return self.balance

@external
@payable
def pay():
    assert msg.value > 0, "msg.value = 0"
    self.owner = msg.sender
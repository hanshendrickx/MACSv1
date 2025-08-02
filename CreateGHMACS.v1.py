class Address:
    """
    Represents a simple user address for the access control system.
    """

    def __init__(self, identifier: str):
        self.identifier = identifier

    def __eq__(self, other):
        if not isinstance(other, Address):
            return False
        return self.identifier == other.identifier

    def __hash__(self):
        return hash(self.identifier)

    def __repr__(self):
        return f"Address('{self.identifier}')"
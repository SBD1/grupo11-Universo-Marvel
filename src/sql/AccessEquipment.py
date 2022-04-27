from db import cursor, conn

class _AccessEquipment:
    def __init__(self, equipment, hero):
        self.equipment = equipment
        self.hero = hero

def AccessEquipment(equipment, hero):
    new_obj = _AccessEquipment(equipment, hero)
    return new_obj
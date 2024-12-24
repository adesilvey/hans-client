from sqlalchemy import Column, Integer, String, DateTime
from sqlalchemy.sql import func
from database import Base

class UserData(Base):
    __tablename__ = 'user_data'

    id = Column(Integer, primary_key=True, index=True)
    display_name = Column(String, index=True)
    overall = Column(Integer, index=True)
    attack = Column(Integer, index=True)
    woodcutting = Column(Integer, index=True)
    timestamp = Column(DateTime, server_default=func.now())
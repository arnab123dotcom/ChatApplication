from database_connection.base_declaration import Base
from sqlalchemy import Integer, String, Column, DateTime, ForeignKey

class User(Base):
    __tablename__ = "users"

    user_id = Column(Integer, primary_key = True)
    user_name = Column(String(100))
    user_email = Column(String(100), unique = True, nullable = False)
    user_password = Column(String(100))

class Messages(Base):
    __tablename__ = "messages"

    message_id = Column(Integer, primary_key=True)
    messages = Column(String)
    timeof_message = Column(DateTime)
    my_linked_email = Column(String, ForeignKey("users.user_email"))
    friends_linked_email = Column(String, ForeignKey("users.user_email"))
